return unless Meteor.isServer

youtubedl = Meteor.npmRequire 'youtube-dl'
youtubedlLogger = new AppLog('youtubedl')

###
  Fetch download info of the given URL
###
getYoutubeDownloadInfo = (url) ->
  
    _youtubedl_call = Meteor._wrapAsync( youtubedl.getInfo )
    info = _youtubedl_call( url )


Meteor.methods
  'getDownloadInfo': getYoutubeDownloadInfo
