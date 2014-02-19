
{join} = require('path')

{cp}      = require 'shelljs'
{groupBy} = require 'prelude-ls'
{getWith} = require('allong.es').allong.es

# Takes a from path, and a to path and an array of {from: '' to: '' dir: ''}
# objects and copies them
exports.renameFiles = (from, to, files) ->
  folders = (Object.keys groupBy (getWith 'dir'), files).map (f) ->
    join to, f
  mkdir '-p', folders
  files.forEach (f) ->
    cp (join from, f.from), (join to, f.to)


