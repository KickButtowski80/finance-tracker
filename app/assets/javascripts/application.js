// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require twitter/bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).on('ready', function() {
    const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"]; 
    let date = new Date().getMonth();
    document.getElementById("current_date").innerHTML = monthNames[date];
    
    
    
    document.getElementById("increment_month").onclick = function(){ 
        let month = monthNames.indexOf(document.getElementById("current_date").innerHTML)  + 1;
        console.log( month + " " + date )
        document.getElementById("current_date").innerHTML = monthNames[month] ;   
  }
  
    document.getElementById("decrement_month").onclick = function(){   
        let month = monthNames.indexOf(document.getElementById("current_date").innerHTML)  - 1;
         document.getElementById("current_date").innerHTML = monthNames[month] ;
  }
});


 