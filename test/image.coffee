
assert = require('assert')
{readFileSync} = require('fs')
image  = require('../lib/image')
file   = require('../lib/file')

testImages = JSON.parse readFileSync './test/resources/ls.json'

describe 'Image', ->
  describe '#valid', ->
    it 'returns true for jpgs, pngs and gifs', ->
      [ '.jpg', '.png', '.gif'
        '.JPG', '.PNG', '.GIF'
      ].forEach (e) ->
        assert image.valid(ext: e)

    it 'returns false for random extensions', ->
      [ '.txt', '' ].forEach (e) ->
        assert.notEqual image.valid(ext: e)

  describe '#exif', ->
    it 'returns a img object with the gathered tags on it', (done) ->
      image.exif('test/resources/Aachen/Events - 1357.jpg').nodeify done

  describe '#exifDate', ->
    it 'returns the date when the photo was taken from a exif tags obj', () ->
      date = image.exifDate testImages[0].tags
      assert.equal date, '2013:06:28 16:33:23'
