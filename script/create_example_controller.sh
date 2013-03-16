#!/bin/bash

# Create a Example server
rails g model FooBar name:string age:integer date_of_birth:date lunch_time:time programmer:boolean joined_at:datetime
rails g scaffold_controller Awesome/FooBar name:string age:integer date_of_birth:date lunch_time:time programmer:boolean joined_at:datetime

# Setup the Database
rake db:migrate db:test:prepare

