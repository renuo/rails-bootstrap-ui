import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['code'];

  copy() {
    const text = this.codeTarget.querySelector('pre').innerText;
    navigator.clipboard.writeText(text);
  }
}
