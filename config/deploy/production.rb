# frozen_string_literal: true

server "participa.castillalamancha.es", roles: %w(app db web worker)
set :branch, "master"
