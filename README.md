## Ruby version
 - Ruby 2.0.0
 - Rails 4.0.0
 - [Grape](https://github.com/intridea/grape) - a framework for API
 
## Repos
 - Github: https://github.com/codefortomorrow/food-api.git
 - Heroku: git@heroku.com:foodopendata-api.git

## Files to edit
`db/migrate/* ` schemes for each table
`app/api/api.rb` the file that mounts API modules
`app/api/*api.rb` the controllers for each API module


## How to run
`rails s`


##Local database operation
#### drop the database
`rake db:drop`

#### recreate the empty database
`rake db:migrate`

#### populate the database with your seed data
`rake db:seed`


##How to deploy to Heroku

#### add the repo
`git remote add heroku git@heroku.com:foodopendata-api.git`

#### push to the Heroku
`git push heroku master`

#### drop the database
`heroku pg:reset DATABASE`

#### recreate the empty database
`heroku run rake db:migrate`

#### populate the database with your seed data
`heroku run rake db:seed`





