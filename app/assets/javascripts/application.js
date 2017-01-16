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
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require social-share-button
//= require_tree .


$(function()  {
$(document).on('ready page:load', function ()  {

/* global ImglyKit */
"use strict";

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
  

});
});




// we don't use animated progress
Turbolinks.ProgressBar.prototype.refresh = function() {}
// custom css
Turbolinks.ProgressBar.defaultCSS = ""

// creates progress bar with custom markup
Turbolinks.ProgressBar.prototype.installProgressElement = function() {
  return $('body').before($('<div class="modal2"></div>'));
}

// removes progress bar with custom markup
Turbolinks.ProgressBar.prototype.uninstallProgressElement = function() {
  $(document).find('.modal2').fadeOut('fast');
}

// changes the default 500ms threshold to show progress bar
Turbolinks.BrowserAdapter.prototype.showProgressBarAfterDelay = function() {
  return this.progressBarTimeout = setTimeout(this.showProgressBar, 50);
};

