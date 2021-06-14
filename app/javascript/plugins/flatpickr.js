import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/airbnb.css'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

  flatpickr("#booking_beginning_date_time", {
    altInput: true,
     enableTime: true,
    dateFormat: "Y-m-d H:i",
  });

 flatpickr("#booking_end_date_time", {
     enableTime: true,
     noCalendar: true,
    dateFormat: "H:i",

  });

