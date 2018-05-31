function removeFlashes() {
  const flash = document.querySelector(".alert");

function flashesRemove () {
flash.remove();
 }

  if (flash) {
    setTimeout(flashesRemove, 3300);
  };
}

export { removeFlashes };


