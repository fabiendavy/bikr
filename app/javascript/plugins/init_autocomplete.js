import places from 'places.js';

const initAutocomplete = () => {
  // const locationSearch = document.getElementById('search_location');
  // if (locationSearch) {
  //   places({ container: locationSearch });
  // }
  const bikePlace = document.getElementById('bike_location');
  if (bikePlace) {
    places({ container: bikePlace });
  }
};

export { initAutocomplete };
