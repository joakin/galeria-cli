
{join} = require 'path'

{ls}      = require 'shelljs'
Promise   = require 'bluebird'

{pathToFile}  = require './file'
{valid, exif} = require './image'
photo         = require './photo'
{mapLimit}    = require './promises'

# Takes a path and returns an array of promises with image maps full of their
# information.
exports.images = (p) ->
  imgsP = ls '-R', p
    # .map (f) -> join p, f
    .map pathToFile
    .filter valid

  getExif = (img) ->
    exif(join p, img.path).then (tags) ->
      img.tags = tags
      img

  mapLimit getExif, 10, imgsP

exports.newImages = (imgs) ->
  imgs.map photo.new

exports.imagesToFileCopyingInfo = (imgs) ->
  imgs.map photo.toFile

