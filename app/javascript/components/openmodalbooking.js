const booking_button = document.getElementById("booking_button");

const myModal = () => {
  booking_button.addEventListener("click", () => {
    const startDate = document.getElementById("booking_start_date").value;
    const endDate = document.getElementById("booking_end_date").value;
    console.log(startDate);
    document.getElementById("booking_modal_body").innerHTML = "Reservation confirmed !";
    $("#booking_modal").modal("show");
  });
}

export { myModal };
