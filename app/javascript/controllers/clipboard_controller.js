import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  copy() {
    const textarea = document.createElement('textarea');
    textarea.value = this.element.innerText;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
  }
}
