import { Controller } from '@hotwired/stimulus';

const optionSelector = "[role='option']:not([aria-disabled])";
const activeSelector = "[aria-selected='true']";

export default class AutocompleteController extends Controller {
  static targets = ['input', 'hidden'];

  static classes = ['selected'];

  static values = {
    ready: Boolean,
    submitOnEnter: Boolean,
    url: String,
    minLength: Number,
    delay: { type: Number, default: 0 },
    queryParam: { type: String, default: 'q' },
    inputParam: { type: String, default: 'value' },
  };

  static uniqOptionId = 0;

  resultsContainer = null;

  connect() {
    this.buildResultsContainer();
    this.close();

    if (!this.inputTarget.hasAttribute('autocomplete')) this.inputTarget.setAttribute('autocomplete', 'off');
    this.inputTarget.setAttribute('spellcheck', 'false');

    this.mouseDown = false;

    this.onInputChange = this.debounce(this.onInputChange, this.delayValue);

    this.inputTarget.addEventListener('keydown', this.onKeydown);
    this.inputTarget.addEventListener('blur', this.onInputBlur);
    this.inputTarget.addEventListener('input', this.onInputChange);
    this.resultsContainer.addEventListener('mousedown', this.onResultsMouseDown);
    this.resultsContainer.addEventListener('click', this.onResultsClick);

    if (this.inputTarget.hasAttribute('autofocus')) {
      this.inputTarget.focus();
    }

    this.readyValue = true;
  }

  disconnect() {
    if (this.hasInputTarget) {
      this.inputTarget.removeEventListener('keydown', this.onKeydown);
      this.inputTarget.removeEventListener('blur', this.onInputBlur);
      this.inputTarget.removeEventListener('input', this.onInputChange);
    }

    if (this.hasResultsTarget) {
      this.resultsContainer.removeEventListener('mousedown', this.onResultsMouseDown);
      this.resultsContainer.removeEventListener('click', this.onResultsClick);
    }
  }

  sibling(next) {
    const { options } = this;
    const selected = this.selectedOption;
    const index = options.indexOf(selected);
    const sibling = next ? options[index + 1] : options[index - 1];
    const def = next ? options[0] : options[options.length - 1];
    return sibling || def;
  }

  select(target) {
    const previouslySelected = this.selectedOption;
    if (previouslySelected) {
      previouslySelected.removeAttribute('aria-selected');
      previouslySelected.classList.remove(...this.selectedClassesOrDefault);
    }

    target.setAttribute('aria-selected', 'true');
    target.classList.add(...this.selectedClassesOrDefault);
    this.inputTarget.setAttribute('aria-activedescendant', target.id);
    target.scrollIntoView({ behavior: 'auto', block: 'nearest' });
  }

  onKeydown = (event) => {
    const handler = this[`on${event.key}Keydown`];
    if (handler) handler(event);
  };

  onEscapeKeydown = (event) => {
    if (!this.resultsShown) return;

    this.hideAndRemoveOptions();
    event.stopPropagation();
    event.preventDefault();
  };

  onArrowDownKeydown = (event) => {
    const item = this.sibling(true);
    if (item) this.select(item);
    event.preventDefault();
  };

  onArrowUpKeydown = (event) => {
    const item = this.sibling(false);
    if (item) this.select(item);
    event.preventDefault();
  };

  onTabKeydown = (event) => {
    const selected = this.selectedOption;
    if (selected) this.commit(selected);
  };

  onEnterKeydown = (event) => {
    const selected = this.selectedOption;
    if (selected && this.resultsShown) {
      this.commit(selected);
      if (!this.hasSubmitOnEnterValue) {
        event.preventDefault();
      }
    }
  };

  onInputBlur = () => {
    if (this.mouseDown) return;
    this.close();
  };

  commit(selected) {
    if (selected.getAttribute('aria-disabled') === 'true') return;

    if (selected instanceof HTMLAnchorElement) {
      selected.click();
      this.close();
      return;
    }

    const jsonResult = JSON.parse(decodeURIComponent(selected.getAttribute('data-autocomplete-result')));
    const textValue = jsonResult.label;
    const value = jsonResult[this.inputParamValue] || textValue;
    this.inputTarget.value = textValue;

    if (this.hasHiddenTarget) {
      this.hiddenTarget.value = value;
      this.hiddenTarget.dispatchEvent(new Event('input'));
      this.hiddenTarget.dispatchEvent(new Event('change'));
    } else {
      this.inputTarget.value = value;
    }

    this.inputTarget.focus();
    this.hideAndRemoveOptions();
    this.fillOtherFields(jsonResult);
  }

  clear() {
    this.inputTarget.value = '';
    if (this.hasHiddenTarget) this.hiddenTarget.value = '';
  }

  onResultsClick = (event) => {
    if (!(event.target instanceof Element)) return;
    const selected = event.target.closest(optionSelector);
    if (selected) this.commit(selected);
  };

  onResultsMouseDown = () => {
    this.mouseDown = true;
    this.resultsContainer.addEventListener('mouseup', () => {
      this.mouseDown = false;
    }, { once: true });
  };

  onInputChange = () => {
    if (this.hasHiddenTarget) this.hiddenTarget.value = '';

    const query = this.inputTarget.value.trim();
    if (query && query.length >= this.minLengthValue) {
      this.fetchResults(query);
    } else {
      this.hideAndRemoveOptions();
    }
  };

  identifyOptions() {
    const prefix = this.resultsContainer.id || 'stimulus-autocomplete';
    const optionsWithoutId = this.resultsContainer.querySelectorAll(`${optionSelector}:not([id])`);
    optionsWithoutId.forEach((el) => {
      el.id = `${prefix}-option-${AutocompleteController.uniqOptionId += 1}`;
    });
  }

  hideAndRemoveOptions() {
    this.close();
    this.resultsContainer.innerHTML = null;
  }

  fillOtherFields(jsonResult) {
    //   override if you want to autocomplete other fields
  }

  fetchResults = async (query) => {
    if (!this.hasUrlValue) return;

    const url = this.buildURL(query);
    try {
      this.element.dispatchEvent(new CustomEvent('loadstart'));
      const json = await this.doFetch(url);
      this.replaceResults(json);
      this.element.dispatchEvent(new CustomEvent('load'));
      this.element.dispatchEvent(new CustomEvent('loadend'));
    } catch (error) {
      this.element.dispatchEvent(new CustomEvent('error'));
      this.element.dispatchEvent(new CustomEvent('loadend'));
      throw error;
    }
  };

  buildURL(query) {
    const url = new URL(this.urlValue, window.location.href);
    const params = new URLSearchParams(url.search.slice(1));
    params.append(this.queryParamValue, query);
    url.search = params.toString();

    return url.toString();
  }

  doFetch = async (url) => {
    const response = await fetch(url, this.optionsForFetch());

    if (!response.ok) {
      throw new Error(`Server responded with status ${response.status}`);
    }

    return response.json();
  };

  buildResultsContainer() {
    if (this.resultsContainer) return;

    const results = document.createElement('ul');
    results.classList.add('dropdown-menu');
    results.classList.add('autocomplete');
    results.style.width = `${this.inputTarget.offsetWidth}px`;
    this.inputTarget.after(results);
    this.resultsContainer = results;
  }

  buildOption(result) {
    const option = document.createElement('li');
    option.setAttribute('role', 'option');
    option.setAttribute('data-autocomplete-result', encodeURIComponent(JSON.stringify(result)));
    const link = document.createElement('a');
    option.appendChild(link);
    link.classList.add('dropdown-item');
    link.setAttribute('href', '#');
    link.setAttribute('onClick', 'return false;');
    link.innerHTML = result.label;
    return option;
  }

  replaceResults(json) {
    this.resultsContainer.innerHTML = '';
    json.forEach((result) => {
      this.resultsContainer.appendChild(this.buildOption(result));
    });

    this.identifyOptions();
    if (this.options) {
      this.resultsContainer.classList.add('show');
      this.resultsContainer.removeAttribute('hidden');
      this.open();
    } else {
      this.resultsContainer.classList.remove('show');
      this.close();
    }
  }

  open() {
    if (this.resultsShown) return;

    this.resultsShown = true;
    this.element.setAttribute('aria-expanded', 'true');
  }

  close() {
    if (!this.resultsShown) return;

    this.resultsShown = false;
    this.inputTarget.removeAttribute('aria-activedescendant');
    this.element.setAttribute('aria-expanded', 'false');
  }

  get resultsShown() {
    return !this.resultsContainer.hidden;
  }

  set resultsShown(value) {
    this.resultsContainer.hidden = !value;
  }

  get options() {
    return Array.from(this.resultsContainer.querySelectorAll(optionSelector));
  }

  get selectedOption() {
    return this.resultsContainer.querySelector(activeSelector);
  }

  get selectedClassesOrDefault() {
    return this.hasSelectedClass ? this.selectedClasses : ['active'];
  }

  optionsForFetch() {
    return { headers: { 'X-Requested-With': 'XMLHttpRequest' } }; // override if you need
  }

  debounce = (fn, delay = 10) => {
    let timeoutId = null;

    return (...args) => {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(fn, delay);
    };
  };
}
