#!/bin/bash

# Rollback changes to Database
rake db:rollback

# Remove Assets
rm app/assets/javascripts/awesome/foo_bars.js.coffee
rm app/assets/stylesheets/awesome/foo_bars.css.scss

# Remove Controllers
rm app/controllers/awesome/foo_bars_controller.rb
rm spec/controllers/awesome/foo_bars_controller_spec.rb

# Remove Helpers
rm app/helpers/awesome/foo_bars_helper.rb
rm spec/helpers/awesome/foo_bars_helper_spec.rb

# Remove Models
rm app/models/foo_bar.rb
rm spec/models/foo_bar_spec.rb

# Remove Views
rm -rf app/views/awesome/foo_bars
rm -rf spec/views/awesome/foo_bars

# Remove Specs
rm spec/requests/awesome/awesome_foo_bars_spec.rb
rm spec/routing/awesome/foo_bars_routing_spec.rb

# Replace Migrations
rm db/migrate/*.rb
cp db/migrate/20130313121005_devise_create_users.rb.example db/migrate/20130313121005_devise_create_users.rb

# Replace Routes
rm config/routes.rb
cp config/routes.rb.example config/routes.rb

