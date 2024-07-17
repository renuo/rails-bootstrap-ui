import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['tabFieldset'];

  connect() {
    this.toggleTabFieldsetAttributes();
  }

  // This method disables fields that are currently hidden in a different tab from the selected one,
  // therefore preventing them from being submitted by a form.
  toggleTabFieldsetAttributes() {
    this.tabFieldsetTargets.forEach((tabFieldset) => {
      const tabFieldsetVisible = tabFieldset.classList.contains('active');
      tabFieldset.disabled = !tabFieldsetVisible;
      const submitButton = tabFieldset.querySelector('input[type="submit"], input[type="button"]');
      submitButton.type = tabFieldsetVisible ? 'submit' : 'button';
    });
  }
}
