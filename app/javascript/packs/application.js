import "bootstrap";
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'
import { French } from "flatpickr/dist/l10n/fr.js"


const element = document.querySelector('#bet_end_date_of_bet')

flatpickr(element, {
  "locale": French,
  minDate: "today",
  dateFormat: "d M Y"

});


