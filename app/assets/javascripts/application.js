// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function() {

/* global ImglyKit */
"use strict";
window.onload = function() {
  /*
   * Initialize ImglyKit
   */
  var kit = new ImglyKit({
    renderer: "canvas", // Defaults to "webgl", uses "canvas" as fallback
    assetsUrl: "/imglykit/assets", // The URL / path where all assets are
    container: document.querySelector("#container"),
    ui: {
      enabled: true,
      showExportButton: true,
      export: {
        type: ImglyKit.ImageFormat.JPEG
      }
    },
    renderOnWindowResize: true // Our editor's size is relative to the window size
  });

  kit.run();

  /*
   * We have a "Render" button which (on click) will request the rendered
   * image from ImglyKit and add it to the DOM
   */
  var button = document.getElementById("render-button");
  button.addEventListener("click", function (e) {
    e.preventDefault();

    // This will render the image with 100 pixels in width while
    // respecting the aspect ratio
    // Possible render types: image, data-url
    var image = kit.render("image", "image/png")
      .then(function (image) {
        document.body.appendChild(image);
      });
  });
  
    // Let `kit` be your ImglyKit instance
    kit.render("data-url", "image/png")
      .then(function (dataUrl) {
     
      $.ajax({
      type: "POST",
      url: "microposts/create",
      data: {
        image: dataUrl
      }
    }).done(function(o) {
      console.log('saved');
    });
     
 });
  
  
};



});



