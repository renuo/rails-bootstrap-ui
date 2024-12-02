import { Controller } from '@hotwired/stimulus';

export default class CustomFlatpickrController extends Controller {
  static targets = ['inputField'];

  connect() {
    flatpickr(this.inputFieldTarget, {
      altInput: true, // creates a prettier input field
      enableTime: true, // add time picker
      time_24hr: true, // sets a 24 hour time picker
      minTime: '09:00',
      maxTime: '17:30',
      locale: {
        firstDayOfWeek: 1, // start week on Monday
      },
      disable: [
        function (date) {
          return date.getDay() === 0 || date.getDay() === 6; // disable weekends
        },
      ],
      minDate: 'today', // sets the minimum date
      maxDate: new Date().fp_incr(14), // sets the maximum date 2 weeks from now
    });
  }
}
