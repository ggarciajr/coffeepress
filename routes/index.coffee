
#
# * GET home page.
# 
exports.index = (req, res) ->
  res.render "index",
    title: "My CoffeePress Blog"
    posts: []

