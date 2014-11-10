@Modals = {
    close: (modal_id) ->
        console.log("closing modal #{modal_id}")
        $("#modal-#{modal_id}").prop('checked',false)

        $(document.documentElement).removeClass('md-perspective')

    open: (modal_id) ->
        console.log("opening modal #{modal_id}")
        $("#modal-#{modal_id}").prop('checked',true)

        Meteor.setTimeout( ->
            $(document.documentElement, 'md-perspective')
        , 25 )

    toggle: (modal_id) ->
        el = $("#modal-#{modal-id}")

        if( el.prop('checked') )
            Modals.close(modal_id)
        else
            Modals.open(modal_id)

}


Template.modal.events = 
    'changed .modal-state': (ev, tmpl) ->
        ev.stopPropagation()

        Modals.toggle( tmpl.data.id )
