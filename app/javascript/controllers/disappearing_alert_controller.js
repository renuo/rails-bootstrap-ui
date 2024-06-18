import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['alert', 'alertTemplate'];

  connect() {
    this.bsAlert = bootstrap.Alert.getOrCreateInstance(this.element);
  }

  liveAlert() {
    const template = this.alertTemplateTarget;
    const clone = template.content.cloneNode(true);
    document.body.appendChild(clone);
  }

  dismissAlert() {
    this.bsAlert.close();
  }
}
