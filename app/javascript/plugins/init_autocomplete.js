import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('tennis_court_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
