module.exports = 
  index: (req, res) ->
    res.render "index",
      title: "My CoffeePress Blog"
      posts: []

  newPost: (req, res) ->
    res.render 'add_post',
    	title: "Write New Post"
