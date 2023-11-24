// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
// import 'bootstrap'
// import 'bootstrap/dist/css/bootstrap.min.css'

// Your other JavaScript code here

// document.addEventListener("turbolinks:load", () => {
  // Your JavaScript code that needs to run on each page load
// });
document.addEventListener("turbo:load", () => {
    // Your JavaScript code that needs to run on each page load
  });