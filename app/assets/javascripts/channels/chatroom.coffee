(($) ->
  $ ->
    chatroom = $("#room")
    App.chatroom = App.cable.subscriptions.create {
        channel: "ChatroomChannel",
        room_id: chatroom.attr("name"),
      },

      connected: ->
      # Called when the subscription is ready for use on the server

      disconnected: ->
      # Called when the subscription has been terminated by the server

      received: (data) ->
        chatroom.append data.message 
        $("#room").scrollTop($("#room").scrollTop() + $(".single").last().position().top);

      speak: (message,room_id) ->
        @perform 'speak', message:message, room_id:room_id

) jQuery
