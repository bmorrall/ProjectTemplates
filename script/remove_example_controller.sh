#!/bin/bash

# Remove Assets
rm app/assets/javascripts/examples.js.coffee
rm app/assets/stylesheets/examples.css.scss

# Remove Controllers
rm app/controllers/examples_controller.rb
rm spec/controllers/examples_controller_spec.rb

# Remove Helpers
rm app/helpers/examples_helper.rb
rm spec/helpers/examples_helper_spec.rb

# Remove Models
rm app/models/example.rb
rm spec/models/example_spec.rb

# Remove Views
rm -rf app/views/examples
rm -rf spec/views/examples

# Remove Specs
rm spec/requests/examples_spec.rb
rm spec/routing/examples_routing_spec.rb

# Replace Migrations
rm db/migrate/*.rb
cp db/migrate/20130313121005_devise_create_users.rb.example db/migrate/20130313121005_devise_create_users.rb

# Replace Routes
rm config/routes.rb
cp config/routes.rb.example config/routes.rb

