// FlATPICKR
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";
import 'flatpickr/dist/flatpickr.min.css';
import "bootstrap";

function Calendar() {
  const element = document.querySelector('#bet_end_date_of_bet');

  if (element) {
    flatpickr(element, {
      "locale": French,
      minDate: "today",
      dateFormat: "d/m/Y",
      disableMobile: true
    });
  }
}
export { Calendar };
