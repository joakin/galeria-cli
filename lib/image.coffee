Promise   = require 'bluebird'
extractif = Promise.promisify require 'extractif'

extensions = [ '.jpg', '.gif', '.png' ]

# Returns true if a img map is not a folder or an invalid extension
exports.valid = (img) ->
  return no if not img.ext? or img.ext is ''
  extensions.indexOf(img.ext.toLowerCase()) isnt -1

# Returns the promise of a img map filled with exif data
exports.exif = (path) -> extractif("\"#{path}\"")

# Returns the exif date of the tags object
exports.exifDate = (tags) ->
  tags['Date and Time'] or
  tags['Date and Time (Original)'] or
  tags['Date and Time (Digitized)'] or
  throw new Error "No date or time found on exif data:\n #{tags}"
