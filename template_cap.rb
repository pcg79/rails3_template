#----------------------------------------------------------------------------
# Capistrano
#----------------------------------------------------------------------------
if yes?('Use Capistrano for the app? (yes/no)')
  gem 'capistrano'
  capify!
  run "bundle install"
end
