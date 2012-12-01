
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
mongoose = require("mongoose")
user = require("./routes/user")
http = require("http")
path = require("path")
app = express()
app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  mongoose.connect 'mongodb://localhost/coffeepress-dev'
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  mongoose.connect 'mongodb://localhost/coffeepress-prod'
  app.use express.errorHandler()

app.get "/", routes.index
app.get "/post/new", routes.newPost
app.post "/post/new", routes.addPost
app.get "/post/:id", routes.viewPost
app.get "/users", user.list

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
