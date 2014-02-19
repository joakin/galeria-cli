
assert = require 'assert'
{readFileSync} = require('fs')

photo = require('../lib/photo')

testImages = JSON.parse readFileSync './test/resources/ls.json'
testImage = testImages[0]

describe 'Photo', ->

  describe '#new', ->

    newImage = null
    beforeEach ->
      newImage = photo.new testImage

    it 'should return a new photo object', ->
      assert.notEqual newImage, testImage
    it 'the newImage should have the old data in there', ->
      assert.equal newImage.old, testImage
    it 'the newImage should have a new name and path', ->
      assert.notEqual newImage.name, testImage.name
      assert.notEqual newImage.path, testImage.path

  describe '#newName', ->
    it 'should return a new name for the image', ->
      newName = photo.newName testImage
      assert.equal newName, '2013-06-28-16-33-23-IMG_0690'

  describe '#newDir', ->
    it 'should return the new dir with date folders extracted', ->
      newDir = photo.newDir testImage
      assert.equal newDir, '2013'

  describe '#imageToFile', ->
    it 'should return an object with from: to: and dir: from an img', ->
      file = photo.toFile photo.new testImage
      assert.deepEqual file,
        from: '2013/06/28/IMG_0690.JPG'
        to:   '2013/2013-06-28-16-33-23-IMG_0690.JPG'
        dir:  '2013'

