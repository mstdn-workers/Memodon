# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.5.0'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'mstdn_ivory'
gem 'activerecord', require: 'active_record'
gem 'thin'

gem 'slim'
gem 'sass'

gem 'rake'


group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'sinatra-contrib'
end
