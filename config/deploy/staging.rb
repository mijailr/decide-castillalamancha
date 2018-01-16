# frozen_string_literal: true

server "participa-pre.castillalamancha.es", roles: %w(app db web worker)
set :rails_env, "production"
set :branch, "master"

