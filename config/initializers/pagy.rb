require 'pagy/extras/pagy'
Pagy::DEFAULT[:limit] = 10
Pagy::DEFAULT.freeze
Rails.application.config.assets.paths << Pagy.root.join('javascripts')