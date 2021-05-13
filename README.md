# README

Rails app with GraphQL API


## System dependencies

* ruby -v : ruby 3.0.1

* rails -v : Rails 6.1.3.1

* rails new blog-app -d mysql -T  

* rails db:create db:migrate db:seed

* bundle add graphql

* bundle install

* rails generate graphql:install

* rails server

* open the browser and run http://localhost:3000/graphql

* rails g graphql:object user

* rails g graphql:object post

* rails g graphql:object comment

* rails g graphql:object reaction
