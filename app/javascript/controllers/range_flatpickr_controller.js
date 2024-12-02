import { Controller } from '@hotwired/stimulus';

export default class RangeFlatpickrController extends Controller {
  static targets = ['inputField'];

  connect() {
    flatpickr(this.inputFieldTarget, {
      altInput: true, // creates a prettier input field
      mode: 'range', // allows a range of dates to be selected
      defaultDate: [new Date(), new Date().fp_incr(14)], // sets the default values
    });
  }
}
