// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// Activate nav li which corresponds to url.
function activateNavItem() {
  var slashIndex = location.href.lastIndexOf("/");
  var questionIndex = location.href.lastIndexOf("?");
  var pageName;
  if (0 <= questionIndex) {
    // リクエストパラメータ付きURL
    pageName = location.href.slice(slashIndex + 1, questionIndex);
  } else {
    // リクエストパラメータなしURL
    pageName = location.href.substr(slashIndex + 1);
  }
  var navItem = document.getElementById("nav-item-" + pageName);
  if (navItem) {
    navItem.className = "active";
  }
}


$(document).ready(function(){
  activateNavItem();
  // dismiss bootstrap alert by x button
  $(".alert").alert();

});
