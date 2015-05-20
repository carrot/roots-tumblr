tumblr = require '../../../lib'

module.exports =
  extensions: [tumblr(require('./data'))]
  jade:
    pretty: true
