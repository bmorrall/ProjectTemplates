#!/bin/bash

# Create a Example server
rails g scaffold Example name:string age:integer date_of_birth:date programmer:boolean

# Setup the Database
rake db:migrate db:test:prepare

