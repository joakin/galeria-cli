
{join, sep} = require 'path'

{exifDate}   = require './image'
{pathToFile} = require './file'

# Returns the new name of an image (looking at the exif properties)
exports.newName = newName = (img) ->
  date = exifDate(img.tags).replace /\ |:/g, '-'
  "#{date}-#{img.name}"


# Is s a number in a string? Looks for other chars also like - _ and spaces.
# Also numbers followed by letters.
validFolder = (s) ->
  !s.match /^[0-9 _-]+[a-zA-Z _-]*$/

# Removes not category categories from the list of categories
removeUnwantedCategories = (categories) ->
  categories.filter validFolder

# Returns the new directory of an image. Removes date based dirs and adds only
# the year
exports.newDir = newDir = (img) ->
  folders = removeUnwantedCategories img.dir.split sep
  year = exifDate(img.tags).split(':')[0]
  join year, folders.join sep


# Takes a image map and returns a new image map with the photo renamed and with
# the path cleaned of unwanted folders
exports.new = (img) ->
  {ext} = img
  name = newName img
  dir = newDir img
  old: img
  dir: dir
  name: name
  ext: ext
  path: join dir, name+ext


# Transforms a photo map into a file map
exports.toFile = (img) ->
  from: img.old.path
  to: img.path
  dir: img.dir

