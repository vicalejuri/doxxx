disqusCommentsLogger = new AppLog('disqusCommentsLogger')

@disqus_shortname = 'doxxx'
@disqus_title       = undefined
@disqus_url         = undefined
@disqus_identifier  = undefined
Template.disqus_comments.created = ->
    return if DISQUS?

    disqus_title = this.data.title ? undefined
    disqus_url   = this.data.url ? undefined
    disqus_identifier = this.data._id ? undefined

    disqusCommentsLogger.log("Embedding DISQUS for the first time...")

    dsq = document.createElement('script')
    dsq.type = 'text/javascript'
    dsq.async = true
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js'

    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq)


# ---
# lets avoid broken layouts
# Update disquss comments size based on the qtd of comments.
#   Yes. 
# -*-
@disqus_config = ->
    this.callbacks = 
        onReady: [->
            setTimeout( ->
                frameHeight = $('#disqus_thread > iframe').height()
                $('#disqus_thread').height(frameHeight)
            , 300 )]
        onNewComment: [ ->
            frameHeight = $('#disqus_thread > iframe').height()
            $('#disqus_thread').height(frameHeight)
       ]

@disqus_config


Template.disqus_comments.rendered = ->
    return if not DISQUS?

    disqusCommentsLogger.log("DISQUS re-rendering...")
    tmpl_data = this.data

    DISQUS.reset({
        reload: true
        config: ->
            this.page.title = tmpl_data.title ? undefined
            this.page.url   = tmpl_data.url ? undefined
    })
