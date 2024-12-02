import { Controller } from '@hotwired/stimulus';

export default class FlatpickrController extends Controller {
  static targets = ['inputField'];

  connect() {
    flatpickr(this.inputFieldTarget, {
      // customize options here
      // see: https://flatpickr.js.org/examples/
    });
  }
}
