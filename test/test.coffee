path = require 'path'
Roots = require 'roots'
should = require 'should'
Util = require 'roots-util'
fs = require 'fs'

_path = path.join(__dirname, 'fixtures')
h = new Util.Helpers(base: _path)

compile_fixture = (fixture_name, done) ->
  @public = path.join(_path, fixture_name, 'public')
  h.project.compile(Roots, fixture_name).then -> done()

before (done) ->
  h.project.remove_folders('**/public')
  h.project.install_dependencies('*', done)

after ->
  h.project.remove_folders('**/public')

describe 'roots-tumblr basic', ->
  before (done) -> compile_fixture.call(@, 'basic', done)

  it 'compiles basic project with default tumblr json', ->
    p = path.join(@public, 'index.html')
    fs.readFileSync(p, encoding: 'utf8').trim().should.equal('''
      <html>
        <head>
          <meta name="if:Show people I follow" content="1"/>
          <meta name="if:Reverse pagination" content="0"/>
          <title>Untitled</title>
          <link rel="shortcut icon" href="https://secure.assets.tumblr.com/images/default_avatar/pyramid_closed_128.png"/>
        </head>
        <body><a href="...">Previous</a><a href="...">Next</a>

          <div id="following">...</div>
        </body>
      </html>
    ''')

describe 'roots-tumblr withData', ->
  before (done) -> compile_fixture.call(@, 'withData', done)

  it 'compiles a project with custom tumblr json', ->
    p = path.join(@public, 'index.html')
    fs.readFileSync(p, encoding: 'utf8').trim().should.equal('''
      <html>
        <head>
          <meta name="if:Show people I follow" content="1"/>
          <meta name="if:Reverse pagination" content="0"/>
          <title>Not Untitled</title>
          <link rel="shortcut icon" href="https://secure.assets.tumblr.com/images/default_avatar/pyramid_closed_128.png"/>
        </head>
        <body><a href="...">Previous</a><a href="...">Next</a>

          <div id="following">...</div>
        </body>
      </html>
    ''')
