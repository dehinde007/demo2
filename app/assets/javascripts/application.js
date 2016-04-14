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


$(document).ready(function() {
    //rotation speed and timer
    var speed = 7000;
    var run = setInterval('rotate()', speed);    
    
    //grab the width and calculate left value
    var item_width = $('#slides li').outerWidth(); 
    var left_value = item_width * (-1); 
        
    //move the last item before first item, just in case user click prev button
    $('#slides li:first').before($('#slides li:last'));
    
    //set the default item to the correct position 
    $('#slides ul').css({'left' : left_value});
    //if user clicked on prev button
    $('#prev').click(function() {
        //get the right position            
        var left_indent = parseInt($('#slides ul').css('left')) + item_width;
        //slide the item            
        $('#slides ul').animate({'left' : left_indent}, 200,function(){    
            //move the last item and put it as first item                
            $('#slides li:first').before($('#slides li:last'));           
            //set the default item to correct position
            $('#slides ul').css({'left' : left_value});
        
        });
        //cancel the link behavior            
        return false;
            
    });
    //if user clicked on next button
    $('#next').click(function() {
        
        //get the right position
        var left_indent = parseInt($('#slides ul').css('left')) - item_width;
        
        //slide the item
        $('#slides ul').animate({'left' : left_indent}, 200, function () {
            
            //move the first item and put it as last item
            $('#slides li:last').after($('#slides li:first'));                     
            
            //set the default item to correct position
            $('#slides ul').css({'left' : left_value});
        
        });
                 
        //cancel the link behavior
        return false;
        
    });        
    
    //if mouse hover, pause the auto rotation, otherwise rotate it
    $('#slides').hover(
        
        function() {
            clearInterval(run);
        }, 
        function() {
            run = setInterval('rotate()', speed);    
        }
    ); 
        
});
//a simple function to click next link
//a timer will call this function, and the rotation will begin :)  
function rotate() {
    $('#next').click();
}




$(document).ready(function() {
    //rotation speed and timer
    var speed = 2000;
    var run = setInterval('rotate()', speed);    
    
    //grab the width and calculate left value
    var item_width = $('#sliders li').outerWidth(); 
    var left_value = item_width * (-1); 
        
    //move the last item before first item, just in case user click prev button
    $('#sliders li:first').before($('#sliders li:last'));
    
    //set the default item to the correct position 
    $('#sliders ul').css({'left' : left_value});
    //if user clicked on prev button
    $('#prev').click(function() {
        //get the right position            
        var left_indent = parseInt($('#sliders ul').css('left')) + item_width;
        //slide the item            
        $('#sliders ul').animate({'left' : left_indent}, 200,function(){    
            //move the last item and put it as first item                
            $('#sliders li:first').before($('#sliders li:last'));           
            //set the default item to correct position
            $('#sliders ul').css({'left' : left_value});
        
        });
        //cancel the link behavior            
        return false;
            
    });
    //if user clicked on next button
    $('#next').click(function() {
        
        //get the right position
        var left_indent = parseInt($('#sliders ul').css('left')) - item_width;
        
        //slide the item
        $('#sliders ul').animate({'left' : left_indent}, 200, function () {
            
            //move the first item and put it as last item
            $('#sliders li:last').after($('#sliders li:first'));                     
            
            //set the default item to correct position
            $('#sliders ul').css({'left' : left_value});
        
        });
                 
        //cancel the link behavior
        return false;
        
    });        
    
    //if mouse hover, pause the auto rotation, otherwise rotate it
    $('#sliders').hover(
        
        function() {
            clearInterval(run);
        }, 
        function() {
            run = setInterval('rotate()', speed);    
        }
    ); 
        
});
//a simple function to click next link
//a timer will call this function, and the rotation will begin :)  
function rotate() {
    $('#next').click();
}