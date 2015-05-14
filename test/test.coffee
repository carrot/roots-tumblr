path = require 'path'
Roots = require 'roots'
should = require 'should'
Util = require 'roots-util'
fs = require 'fs'

_path = path.join(__dirname, 'fixtures')
h = new Util.Helpers(base: _path)


before (done) -> h.project.install_dependencies('*', done)
after -> h.project.remove_folders('**/public')

describe 'roots-tumblr', ->
  before (done) ->
    @public = path.join(_path, 'basic', 'public')
    h.project.compile(Roots, 'basic').then(-> done())

  it 'compiles basic project', ->
    p = path.join(@public, 'index.html')
    fs.readFileSync(p, encoding: 'utf8').trim().should.equal('''
      <html>
        <head>
          <meta name="if:Show people I follow" content="1"/>
          <meta name="if:Reverse pagination" content="0"/>
        </head>
        <body>

          <a href="...">Previous</a> <a href="...">Next</a>

          <div id="following">...</div>

        </body>
      </html>
    ''')
