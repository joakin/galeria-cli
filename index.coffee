
opts = require 'nomnom'
inquirer = require 'inquirer'
colors = require('colors')
Table = require('cli-table')

###############################################################################
#                               cli entry point                               #
###############################################################################

module.exports = ->
  opts
    .command 'organize'
    .help 'Organize the photos of <from> folder into <to> folder'
    .option 'from',
      position: 1
      help: 'Path to find images. Folders inside from will be preserved when possible'
      required: true
    .option 'to',
      position: 2
      help: 'Path where renamed images will be copied to'
      required: true
    .callback organize

  opts.parse()

###############################################################################
#                              organize command                               #
###############################################################################


{images, newImages, imagesToFileCopyingInfo} = require './lib/photos'
{renameFiles} = require './lib/files'

organize = (opts) ->

  {from, to} = opts

  console.log "Searching for photos in " + from.bold.blue

  # TODO: Validate the folders

  images(from).then (imgs) ->

    console.log "Found #{(imgs.length+"").bold.green} photos in #{from.bold.blue}"

    previewQ =
      type: 'confirm'
      name: 'preview'
      message: 'Do you want to preview the transformations?'
      default: true

    inquirer.prompt [previewQ], ({preview}) ->

      renamedImgs = newImages imgs

      if preview
        rows = renamedImgs.map (img) -> [img.old.path, img.path]
        t = new Table
          head: ['from'.blue, 'to'.green]
          chars:
            middle: '→'
            'mid-mid': '─'
            'top-mid': '─'
            'bottom-mid': '─'
          style:
            'padding-left': 2
            'padding-right': 2
        t.push.apply t, rows
        console.log t.toString()

      organizeQ =
        type: 'confirm'
        name: 'organize'
        message: 'Perform the renaming?'
        default: true

      inquirer.prompt [organizeQ], ({organize}) ->

        if not organize
          console.log 'All right, see you later.'.yellow
          process.exit 0
          return

        try
          renameFiles from, to, imagesToFileCopyingInfo renamedImgs
        catch e
          console.error e.red
          process.exit 1

        console.log "Done!".rainbow

        process.exit 0

  .catch (e) ->
    console.error 'ERROR:'.red, e.red
    process.exit 1

