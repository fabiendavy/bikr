import flatpickr from "flatpickr";

require("flatpickr/dist/themes/material_red.css");

  const initFlatpickr = () => {
    flatpickr(".datepicker", {});
  }

export { initFlatpickr };
