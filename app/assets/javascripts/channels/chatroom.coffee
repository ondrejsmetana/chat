(($) ->
  $(document).on "turbolinks:load", ->
    chatroom = $("#room")
    notification = $("#notice")
    App.chatroom = App.cable.subscriptions.create {
        channel: "ChatroomChannel",
        room_id: chatroom.attr("name"),
      },

      connected: ->
      # Called when the subscription is ready for use on the server


      disconnected: ->
      # Called when the subscription has been terminated by the server

      received: (data) ->
        if data.notification
          notification.append data.message
        else  
          chatroom.append data.message 
          $("#room").scrollTop($("#room").scrollTop() + $(".single").last().position().top)

      speak: (message, room_id) ->
        @perform 'speak', message:message, room_id:room_id

      addUser: (user_id, room_id) ->  
        @perform "room_user_update", user_id:user_id, room_id:room_id
        
) jQuery
