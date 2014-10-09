@Modals = {
    close: (modal_id) ->
        $("#modal-#{modal_id}").prop('checked',false)
    open: (modal_id) ->
        $("#modal-#{modal_id}").prop('checked',true)
}
