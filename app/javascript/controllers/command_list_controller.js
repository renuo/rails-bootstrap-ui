import { Controller } from '@hotwired/stimulus';

export default class CommandListController extends Controller {
  static targets = ['list', 'metaKey', 'searchField', 'listGroup', 'listItem'];

  connect() {
    this.modal = new bootstrap.Modal(this.listTarget, {});
    this.children = Array.from(this.listGroupTargets[0].children);
    if (this.listItemTargets.length > 0) {
      this.switchActive(this.listItemTargets[0]);
    }
    this.metaKeyTarget.innerText = this.getMetaKey();

    document.addEventListener('keydown', this.handleKeydown.bind(this));
  }

  disconnect() {
    document.removeEventListener('keydown', this.handleKeydown.bind(this));
  }

  handleKeydown(event) {
    console.log('handling keydown', event.metaKey, event.key);
    if ((event.metaKey) && event.key === 'k') {
      this.openModal();
    }
  }

  openModal() {
    this.modal.show();
    this.searchField().focus();
  }

  performCommand(event) {
    event.preventDefault();
    const searchParts = this.searchField().value.split(',').map((part) => part.trim());
    const command = this.activeCommand.dataset.command
      .replace('_1_', searchParts[0])
      .replace('_2_', searchParts[1])
      .replace('_3_', searchParts[2]);
    if (this.activeCommand.dataset.target === '_blank') {
      window.open(command, '_blank');
    } else {
      Turbo.visit(command);
    }
  }

  getMetaKey() {
    const userAgent = window.navigator.userAgent.toLowerCase();
    if (userAgent.includes(' mac ')) {
      return '⌘';
    }
    return 'CTRL';
  }

  switchActive(element) {
    if (this.activeCommand) {
      this.activeCommand.classList.remove('active');
    }
    element.classList.add('active');
    this.activeCommand = element;
    this.searchField().placeholder = element.dataset.placeholder ?? '';
  }

  selectCommand(event) {
    event.preventDefault();
    this.switchActive(event.currentTarget);
    this.searchField().focus();
  }

  previousItem() {
    const previous = this.listItemTargets[this.listItemTargets.indexOf(this.activeCommand) - 1];
    if (previous) {
      this.switchActive(previous);
    }
  }

  nextItem() {
    const next = this.listItemTargets[this.listItemTargets.indexOf(this.activeCommand) + 1];
    if (next) {
      this.switchActive(next);
    }
  }

  searchField() {
    return this.searchFieldTarget;
  }
}
