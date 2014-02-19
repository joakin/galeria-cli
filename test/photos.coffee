
assert = require('assert')
{readFileSync} = require('fs')
photos = require('../lib/photos')

testImages = JSON.parse readFileSync './test/resources/ls.json'

describe 'Photos', ->
  describe '#images', ->
    it 'should get an array of image maps', (done) ->
      photos.images('test/resources').nodeify done

  describe '#newImages', ->
    it 'should return an array of new images', ->
      newImages = photos.newImages testImages
      assert.equal newImages.length, testImages.length

