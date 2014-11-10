###
    In-place editing.

    Events for Text INPUT's handling the 'escape'/'return'/blur keys  as 'ok' or 'cancel'


    Usage:

      # Create the events handlers on #upload_textfield
      upload_txt_evs = LiveTextInput('#upload_textfield', {
                      ok: (text, evt ) ->
                        console.log("User typed: #{text}");
                      cancel: (ev ) ->
                        console.log("User canceled typing") 
      })

      # Attach it to the template
      Template.someTemplate.events = upload_txt_evs
###
@LiveTextInput = (selector, callbacks) ->
  ok_cb     = callbacks.ok ? _.identity
  cancel_cb = callbacks.cancel ? _.identity

  evts = {}
  evts["keyup #{selector}, keydown #{selector} , focusout #{selector}"] = (ev) ->
    # Escape key
    cancel_cb.call(this,ev) if (ev.type is 'keydown' and ev.which == 27 )

    # Blur/return/enter
    if((ev.type is 'keyup' and ev.which == 13) or ev.type is 'focusout')
      value = String( ev.target.value ? '' )

      ok_cb.call( this, value, ev )      if value 
      cancel_cb.call( this, ev )         if not value 

  evts



# Retrieve current template
getCurrentTemplate =  ->
  Router.current().lookupTemplate()

# Retrieve current route
getCurrentRoute = ->
  Router._currentController.path

isAdmin = (user) ->
    user and user.isAdmin

setAdmin = (user, adm_flag) ->
    user.isAdmin = (not adm_flag)

getAvatarUrl = (user) ->
    Avatar.getUrl( user )
