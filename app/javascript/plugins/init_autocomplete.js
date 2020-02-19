import places from 'places.js';

const initAutocomplete = () => {
  const locationSearch = document.getElementById('search_location');
  if (locationSearch) {
    places({ container: locationSearch });
  }
};

export { initAutocomplete };
