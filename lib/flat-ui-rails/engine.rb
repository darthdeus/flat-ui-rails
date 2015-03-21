
module FlatUi
  module Rails
    class Engine < ::Rails::Engine
      config.assets.paths << File.expand_path(File.join(File.dirname(__FILE__), '../vendor/fonts'))
      config.assets.precompile += %w( *.woff *.eot *.ttf *.svg )
    end
  end
end