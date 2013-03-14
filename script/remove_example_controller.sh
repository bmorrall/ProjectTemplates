#!/bin/bash

# Rollback changes to Database
rake db:rollback

# Remove Assets
rm app/assets/javascripts/awesome/examples.js.coffee
rm app/assets/stylesheets/awesome/examples.css.scss

# Remove Controllers
rm app/controllers/awesome/examples_controller.rb
rm spec/controllers/awesome/examples_controller_spec.rb

# Remove Helpers
rm app/helpers/awesome/examples_helper.rb
rm spec/helpers/awesome/examples_helper_spec.rb

# Remove Models
rm app/models/example.rb
rm spec/models/example_spec.rb

# Remove Views
rm -rf app/views/awesome/examples
rm -rf spec/views/awesome/examples

# Remove Specs
rm spec/requests/awesome/awesome_examples_spec.rb
rm spec/routing/awesome/examples_routing_spec.rb

# Replace Migrations
rm db/migrate/*.rb
cp db/migrate/20130313121005_devise_create_users.rb.example db/migrate/20130313121005_devise_create_users.rb

# Replace Routes
rm config/routes.rb
cp config/routes.rb.example config/routes.rb

