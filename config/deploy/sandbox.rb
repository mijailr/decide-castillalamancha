# frozen_string_literal: true

server "decideclm.alabs.org", roles: %w(app db web worker)
set :branch, "master"
set :rails_env, "staging"
set :repo_url, "https://github.com/alabs/decide-castillalamancha" # Until we have access to GitHub repository 

