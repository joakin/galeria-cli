
assert = require("assert")
file = require("../lib/file")

describe "File", ->
  describe "#pathToFile", ->
    it "should fail with invalid args", ->
      assert.throws file.pathToFile
      assert.throws file.pathToFile.bind(null, null)
      assert.throws file.pathToFile.bind(null, "")

    it "returns a map of the components of the path", ->
      path = "path/to/file/photo.jpg"
      m = file.pathToFile(path)
      assert.deepEqual m,
        path: path
        dir: "path/to/file"
        ext: ".jpg"
        name: "photo"
