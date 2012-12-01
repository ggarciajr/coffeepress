routes = require "../routes/"
require "should"

describe "routes", ->
  req = {}
  req.body =
    params: {}
  res =
    redirect: (route) ->
      # do nothing
    render: (view, vars) -> 
     # do nothing
  describe "index", ->
    it "should display index with posts", (done)->
      res.render = (view, vars) ->
          view.should.equal "index"
          vars.title.should.equal "My CoffeePress Blog"
          vars.posts.should.eql []
          done()
      routes.index(req, res)
  describe "new post", ->
    it "should display the add post page", (done) ->
      res.render = (view, vars) ->
          view.should.equal "add_post"
          vars.title.should.equal "Write New Post"
          done()
      routes.newPost(req, res)
    it "should add a new post when posted to", (done) ->
      console.log "-> #{req.body}"
      req.body.post = 
        title: "My Post!"
        body: "My wonderful little post"
      res.render = (view, vars) ->
        view.should.equal "index"
        vars.posts.should.eql [{title: 'My Post!', body: "My wonderful little post", id: 0}]
        done()

      routes.addPost(req, res)
      routes.index(req, res)