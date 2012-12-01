routes = require "../routes/index"
require "should"

describe "routes", ->
  req = {}
  res = {}
  describe "index", ->
    it "should display index with posts", (done)->
      res.render = (view, vars) ->
          view.should.equal "index"
          vars.title.should.equal "My CoffeePress Blog"
          vars.posts.should.eql []
          done()
      routes.index(req, res)