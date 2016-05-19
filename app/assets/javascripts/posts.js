// app/assets/javascripts/posts.js
$(document).ready(function() {
  $('input[type=submit]').on('click', function(event){

    var form = $(this).parent('form');

    event.preventDefault();


    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();

    $.ajax({
      type: "POST"
      method: method,
      url: action,
      data: data,
      success: function(data) {
        console.log(data);
      },
      error: function(data) {
        console.log("There seems to be an error here.")
      },
      dataType: 'JSON'
    });
  });
})
