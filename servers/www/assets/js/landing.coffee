#= require plunker

#= require ../bootstrap/js/bootstrap-all

#= require router

#= require models/plunks
#= require models/user

#= require views/userpanel
#= require views/gallery

Handlebars.registerHelper "or", (arg1, arg2) -> arg1 or arg2

Handlebars.registerHelper "dateToLocaleString", (updated_at, created_at) ->
  new Date(Date.parse(updated_at or created_at)).toLocaleString()
  
Handlebars.registerHelper "dateToTimestamp", (updated_at, created_at) ->
  Date.parse(updated_at or created_at)

Handlebars.registerHelper "arrayJoinSpace", (array) ->
  array.join(" ")

((plunker) ->

  $ ->
    plunker.user = new plunker.User
    plunker.login()
    
    plunker.collections.plunks = new plunker.PlunkCollection

    plunker.views.userpanel = new plunker.UserPanel
      el: document.getElementById("userpanel")
      model: plunker.user
    
    plunker.views.gallery = new plunker.Gallery
      el: document.getElementById("gallery")
      collection: plunker.collections.plunks
      
    
    plunker.collections.plunks.fetch()
    

)(@plunker or @plunker = {})