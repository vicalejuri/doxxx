return unless Meteor.isServer

youtubedl = Meteor.npmRequire 'youtube-dl'
youtubedlLogger = new AppLog('youtubedl')

###
  Fetch download info of the given URL
###
getYoutubeDownloadInfo = (url) ->
  
    _youtubedl_call = Meteor.wrapAsync( youtubedl.getInfo )
    info = _youtubedl_call( url )
    info

Meteor.methods
  'getDownloadInfo': getYoutubeDownloadInfo
