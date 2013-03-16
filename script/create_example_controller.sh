#!/bin/bash

# Create a Example server
rails g model FooBar name:string age:integer date_of_birth:date programmer:boolean
rails g scaffold_controller Awesome/FooBar name:string age:integer date_of_birth:date programmer:boolean

# Setup the Database
rake db:migrate db:test:prepare

