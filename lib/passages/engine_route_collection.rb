require_relative 'route'
require_relative 'route_collection'
require 'digest/md5'

module Passages
  class EngineRouteCollection < RouteCollection
    def initialize(_routes)
      @routes = _routes.reject { |h| h[:routes].all?(&:internal?) }
    end

    def cache_key
      "engine_routes/" + Digest::MD5.hexdigest((@routes.map { |h| h[:routes] }).to_s)
    end
  end
end
