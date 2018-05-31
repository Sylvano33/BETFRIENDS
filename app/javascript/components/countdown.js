import moment from "moment"

function countDown() {
 const counter = document.querySelector("#countdown");
 const start = document.querySelector("#start-time");

 if (counter && start) {
    const time = moment(start.textContent);
    setInterval(()=>{
      time.subtract(1, 'seconds');
      counter.textContent = time.format("HH:mm:ss")
    }, 1000)
 }

}

export { countDown }

