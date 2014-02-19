
assert = require 'assert'
sh = require 'shelljs'

{images, newImages, imagesToFileCopyingInfo} = require '../lib/photos'
{renameFiles} = require '../lib/files'

lsOrg = require './organized-files-ls.js'

from = 'test/resources'
to   = 'test/resources/organized'

describe 'Files', ->
  describe '#renameFiles', ->
    it 'should rename all the photos to the new folder', (done) ->
      sh.rm '-rf', to
      images(from).then (imgs) ->
        renamedImgs = newImages imgs
        files = imagesToFileCopyingInfo renamedImgs
        renameFiles from, to, files
        assert.deepEqual (sh.ls '-R', to), lsOrg
      .nodeify done

