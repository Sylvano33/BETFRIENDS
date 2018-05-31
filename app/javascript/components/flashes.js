function removeFlashes() {
  const flash = document.querySelector(".alert");

function flashesRemove () {
flash.remove();
 }

  if (flash) {
    setTimeout(flashesRemove, 2000);
  };
}

export { removeFlashes };


