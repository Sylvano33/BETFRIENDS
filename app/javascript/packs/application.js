import "bootstrap";
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'

const element = document.querySelector('#bet_end_date_of_bet')

if (element) {
  flatpickr(element, {
  minDate: "today",
  dateFormat: "Y-m-d",
  altInput: true

});
}
