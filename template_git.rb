#----------------------------------------------------------------------------
# Git Setup
#----------------------------------------------------------------------------
file '.gitignore', <<-FILE
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
public/uploads/*
public/stylesheets
public/javascripts/*_packaged.js
tags
TAGS
.bundle
coverage
FILE

git :init
# git :submodule => "init"
git :add => '.'
git :commit => "-a -m 'Initial commit'"
