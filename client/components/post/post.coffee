postPageLogger = new AppLog('postPageLogger')

Template.post_watch.rendered = (el, tmpl)->
    console.log(  el , tmpl )
