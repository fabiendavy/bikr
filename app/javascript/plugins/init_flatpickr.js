import flatpickr from "flatpickr";

// require("flatpickr/dist/themes/material_red.css");

  const initFlatpickr = () => {
    flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "d.m.Y",
  });
  }

export { initFlatpickr };
