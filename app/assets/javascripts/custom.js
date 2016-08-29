$(document).ready(function(){

  

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

  if ($("#room").length ) {
    $("#room").scrollTop($("#room").scrollTop() + $(".single").last().position().top)
  }

});

//
$(document).on("keypress click", "[data-behavior~=chatroom_speaker]", function(e){

  if(e.keyCode=="13" || e.type=="click")
  {   
    if(e.type=="click" && $(e.target).is("div")) return;
    App.chatroom.speak($("div[data-behavior~=chatroom_speaker]").html(),$("div[data-behavior~=chatroom_speaker]").attr("room-id")); 
    $("div[data-behavior~=chatroom_speaker]").html("");
    e.preventDefault();
  }

});

$(document).on("click", ".dropdown-menu.user li a", function(e){
  if ($("#room").length )
  {

    var user_id = $(this).attr("name");
    var room_id = $("#room").attr("name");

    App.chatroom.addUser(user_id,room_id); 
    e.preventDefault();
  }

});

$(document).on("click", ".dropdown-menu li a.avatar", function(e){


  var avatar_code = $(this).attr("name");
  $("div[data-behavior~=chatroom_speaker]").append(avatar_code);

});