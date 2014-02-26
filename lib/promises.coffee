
Promise = require('bluebird')

# Returns a promise that resolves when all of the operations have been done
# with n concurrency. fn must return a promise.
exports.mapLimit = (fn, n, arr) ->
  queued = []
  parallel = n or 10
  Promise.map arr, (item) ->
    mustComplete = Math.max 0, queued.length - parallel + 1
    current = Promise.some(queued, mustComplete).then (previous) ->
      fn(item)
    queued.push current
    current
