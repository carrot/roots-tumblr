RootsUtil = require 'roots-util'
path = require 'path'
{compile} = require 'tumblr-theme-parser'


module.exports = (data) ->
  class TumblrCompiler
    constructor: ->
      @data = {}

    fs: ->
      category: 'tumblr-markup'
      extract: true
      detect: (f) ->
        # just a crude extension check... the compiler will let the markup pass
        # through unchanged if it turns out this is just regular html
        path.extname(f.relative) is '.html'

    compile_hooks: ->
      category: 'tumblr-markup'
      'after_file': (ctx) ->
        ctx.content = compile(ctx.content.toString('utf8'), data)
