run "rm -Rf README public/index.html public/javascripts/* app/views/layouts/*"

gem 'haml', '>=3.0.4'
gem "compass", ">= 0.10.1"

gem "factory_girl", :git => "git://github.com/thoughtbot/factory_girl.git", :branch => 'rails3', :group => :test
gem 'shoulda', :git => 'git://github.com/thoughtbot/shoulda.git', :branch => "rails3", :require => nil, :group => :test

gem 'rails3-generators', :git => "git://github.com/indirect/rails3-generators.git"

application  <<-GENERATORS
config.generators do |g|
  g.template_engine :haml
  g.orm             :active_record
  g.test_framework  :shoulda
  g.fallbacks[:shoulda] = :test_unit
  g.fallbacks[:haml] = :erb
end
GENERATORS

run "bundle install"
run "compass init --using blueprint --app rails -x sass --sass-dir app/stylesheets --css-dir public/stylesheets"

get "http://code.jquery.com/jquery-1.4.2.min.js", "public/javascripts/jquery.js"
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
get "http://github.com/rwc9u/rails3_template/raw/master/screen.sass", "app/stylesheets/screen.sass"
get "http://github.com/rwc9u/rails3_template/raw/master/application.html.haml", "app/views/layouts/application.html.haml"

# fix some issues with handling shoulda in Rails 3
apply "http://github.com/rwc9u/rails3_template/raw/master/template_testing.rb"

# capistrano config
apply "http://github.com/rwc9u/rails3_template/raw/master/template_cap.rb"

apply "http://github.com/rwc9u/rails3_template/raw/master/template_git.rb"

puts "SUCCESS!"
