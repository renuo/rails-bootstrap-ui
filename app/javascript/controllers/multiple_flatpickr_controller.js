import { Controller } from '@hotwired/stimulus';

export default class MultipleFlatpickrController extends Controller {
  static targets = ['inputField'];

  connect() {
    flatpickr(this.inputFieldTarget, {
      altInput: true, // creates a prettier input field
      altFormat: 'd M Y', // overwrites date format with altInput enabled (dateFormat does not work)
      mode: 'multiple', // allows multiple dates to be selected
    });
  }
}
