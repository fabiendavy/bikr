var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
var priceInput = document.getElementById("bike_price_per_day");

const showSliderValue = () => {
  if (slider && output) {
    output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function() {
      output.innerHTML = `${this.value}`;
      priceInput.value = this.value
    }
  }
}

export { showSliderValue };
