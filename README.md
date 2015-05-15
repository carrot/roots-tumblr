# Roots Tumblr

[![npm](http://img.shields.io/npm/v/roots-tumblr.svg?style=flat)](https://badge.fury.io/js/roots-tumblr) [![tests](http://img.shields.io/travis/carrot/roots-tumblr/master.svg?style=flat)](https://travis-ci.org/carrot/roots-tumblr)  [![dependencies](http://img.shields.io/gemnasium/carrot/roots-tumblr.svg?style=flat)](https://gemnasium.com/carrot/roots-tumblr)
[![devDependencies](https://img.shields.io/david/dev/carrot/roots-tumblr.svg)](https://gemnasium.com/carrot/roots-tumblr)


This is an extension to make building Tumblr themes easier, or make it easier to take Tumblr themes and use them outside of Tumblr. It's basically a wrapper around [tumblr-theme-parser](https://www.npmjs.com/package/tumblr-theme-parser).

## Installation
- make sure you are in your roots project directory
- `npm install roots-tumblr --save`
- login to tumblr and go to the URL `https://www.tumblr.com/customize_api/demo_content/YOURBLOGNAME` and save the JSON that's returned in a file like `./tumblr-demo-content.json`.
- modify your `app.coffee` file to include the extension:

  ```coffee
  tumblr = require 'roots-tumblr'
  tumblrDemoContent = require './tumblr-content'

  module.exports =
    ignores: ['tumblr-demo-content.json']
    extensions: [tumblr(tumblrDemoContent)]
  ```
