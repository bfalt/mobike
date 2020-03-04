import "bootstrap";
import flatpickr from "flatpickr";
import { initUpdateNavbarOnScroll } from './navbar';
import { initFlatpickr } from '../plugins/init_flatpickr';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initUpdateNavbarOnScroll();
initFlatpickr()

initMapbox()
initAutocomplete()
