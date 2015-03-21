require "flat-ui-rails/version"

module FlatUi
  module Rails
    if ::Rails.version.to_s < "3.1"
      require "flat-ui-rails/railtie"
    else
      require 'flat-ui-rails/engine'
    end
  end
end

