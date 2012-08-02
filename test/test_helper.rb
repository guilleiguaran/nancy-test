require "./app"
require "minitest/unit"
require "minitest/autorun"
require "capybara"
require "capybara/dsl"

ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))['test'])
