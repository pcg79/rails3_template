#----------------------------------------------------------------------------
# Capistrano
#----------------------------------------------------------------------------
if yes?('Use Capistrano for the app? (yes/no)')
  gem 'capistrano'
  run "bundle install"
  capify!
end
