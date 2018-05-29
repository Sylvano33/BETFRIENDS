import "bootstrap";
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css'
import { French } from "flatpickr/dist/l10n/fr.js"


const element = document.querySelector('#bet_end_date_of_bet')

if (element) {
  flatpickr(element, {
  minDate: "today",
  dateFormat: "Y-m-d",
  altInput: true,
  locale: {
        firstDayOfWeek: 1
          }

});
}
flatpickr(element, {
    "locale": French // locale for this instance only
});

