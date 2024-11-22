import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(".flatpickr_date", {
      // customize options here
      // see: https://flatpickr.js.org/examples/
    })

    flatpickr(".custom_flatpickr_date", {
      altInput: true, // creates a prettier input field
      enableTime: true, // add time picker
      time_24hr: true, // sets a 24 hour time picker
      minTime: "09:00",
      maxTime: "17:30",
      locale: {
        firstDayOfWeek: 1, // start week on Monday
      },
      disable: [
        function(date) {
          return date.getDay() === 0 || date.getDay() === 6;  // disable weekends
        }
      ],
      minDate: "today", // sets the minimum date
      maxDate: new Date().fp_incr(14), // sets the maximum date 2 weeks from now
    })

    flatpickr(".multiple_flatpickr_date", {
      altInput: true, // creates a prettier input field
      altFormat: "d M Y", // overwrites date format with altInput enabled (dateFormat does not work)
      mode: "multiple", // allows multiple dates to be selected
    })

    flatpickr(".range_flatpickr_date", {
      altInput: true, // creates a prettier input field
      mode: "range", // allows a range of dates to be selected
      defaultDate: [new Date(), new Date().fp_incr(14)] // sets the default values
    })
  }
}
