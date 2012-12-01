posts = []

module.exports = 
  index: (req, res) ->
    res.render "index",
      title: "My CoffeePress Blog"
      posts: posts

  newPost: (req, res) ->
    res.render 'add_post',
    	title: "Write New Post"

  addPost: (req, res) ->
  	post = req.body.post
  	post.id = posts.length
  	posts.push post
  	res.redirect "/"