
{images, newImages, imagesToFileCopyingInfo} = require './lib/photos'
{renameFiles} = require './lib/files'

from = 'test/resources'
to   = 'test/resources/organized'

images(from).then (imgs) ->
  renamedImgs = newImages imgs
  printOldVsNewImages renamedImgs
  renameFiles from, to, imagesToFileCopyingInfo renamedImgs
.catch (e) ->
  console.error 'ERROR:', e

printOldVsNewImages = (imgs) ->
  imgs.forEach (img) ->
    console.log "#{img.old.path} -> #{img.path}"

