$(document).ready(function(){

  $(".chatroom").on("click", function(e) {

  });

  $(window).scroll(function () {
    var top = $(document).scrollTop();
    $('.splash').css({
      'background-position': '0px -'+(top/3).toFixed(2)+'px'
    });
    if(top > 50)
      $('#home > .navbar').removeClass('navbar-transparent');
    else
      $('#home > .navbar').addClass('navbar-transparent');
  });

  var $button = $("<div id='source-button' class='btn btn-primary btn-xs'>&lt; &gt;</div>").click(function(){
    var html = $(this).parent().html();
    html = cleanSource(html);
    $("#source-modal pre").text(html);
    $("#source-modal").modal();


  });
});

//
$(document).on("keypress", "[data-behavior~=chatroom_speaker]", function(e){

  if(e.keyCode=="13")
  { 
    App.chatroom.speak(e.target.value,$(e.target).attr("room-id")); 
    e.target.value="";
    e.preventDefault();
  }

});