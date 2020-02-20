const button = document.querySelector("#booking_button");
if (button) {
  window.addEventListener('click', () => {
    const calendars = document.querySelector(".flatpickr-calendar");

    if (calendars) {
      console.log('ich');
    }
  });
}
