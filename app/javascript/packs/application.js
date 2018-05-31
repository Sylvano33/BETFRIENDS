import { Calendar } from "../components/flatpickr";
import { HourCountdownOnScroll } from "../components/slider";
import { initClipboard } from "../components/clipboard";
import { removeFlashes } from "../components/flashes";
import { initializeClock } from "../components/countdown";

Calendar();
HourCountdownOnScroll();
initClipboard();
removeFlashes();
const date = document.getElementById('clockdiv').dataset.date;
initializeClock('clockdiv', date);
