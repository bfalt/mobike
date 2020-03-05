import "bootstrap";
import flatpickr from "flatpickr";
import { initUpdateNavbarOnScroll } from './navbar';
import { initFlatpickr } from '../plugins/init_flatpickr';

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

import { initAlgoliaSearch } from "../plugins/init_algolia_search.js";

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

initUpdateNavbarOnScroll();
initFlatpickr();

initMapbox();
initAutocomplete();

initAlgoliaSearch();
