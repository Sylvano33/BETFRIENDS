import ClipboardJS from "clipboard"

function initClipboard () {
  new ClipboardJS(".btn.copy")
}


export { initClipboard };
