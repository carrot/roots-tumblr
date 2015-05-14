RootsUtil = require 'roots-util'
path = require 'path'
{compile} = require 'tumblr-theme-parser'

# these are some extensions that we know we can't compile... really, we can only
# compile HTML, but all compile-to-HTML languages need to be accounted for, so
# we need a blacklist rather than just a whitelist. this issue is caused by the
# fact that roots doesn't re-run detection when a file's extension changes.
BLACKLISTED_FILE_EXTENSIONS = [
  '.jpg', '.gif', '.png', '.css', '.styl', '.js', '.coffee'
]

module.exports = (data) ->
  class TumblrCompiler
    constructor: ->
      @data = {}

    fs: ->
      category: 'tumblr-markup'
      extract: true
      detect: (f) ->
        path.extname(f.relative) not in BLACKLISTED_FILE_EXTENSIONS

    compile_hooks: ->
      category: 'tumblr-markup'
      'after_file': (ctx) ->
        # just a crude extension check... the compiler will let the markup pass
        # through unchanged if it turns out this is just regular html
        if ctx['out_ext'] is 'html'
          ctx.content = compile(ctx.content.toString('utf8'), data)
