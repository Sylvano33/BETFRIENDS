function HourCountdownOnScroll() {
  const slider = document.getElementById("hour-range");
  const output = document.getElementById("range-value");

  if (output && slider) {
    output.innerHTML = slider.value;
    slider.oninput = function() {
      output.innerHTML = this.value;
    };
  }
}

export { HourCountdownOnScroll };
