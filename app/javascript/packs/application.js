import "bootstrap";
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import { French } from "flatpickr/dist/l10n/fr.js";
import 'dist/clipboard.min.js';



// DATEPICKR
const element = document.querySelector('#bet_end_date_of_bet')

if (element) {
  flatpickr(element, {
    "locale": French,
    minDate: "today",
    dateFormat: "d-m-y",
    disableMobile: true
  });
}


