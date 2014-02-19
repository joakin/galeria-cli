
assert = require 'assert'
path   = require 'path'

exports.pathToFile = (p) ->
  assert p? and p.length > 0, 'Invalid path'

  path: p
  dir:  path.dirname p
  ext:  path.extname p
  name: path.basename p, path.extname p

