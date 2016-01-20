require_relative 'route'
require 'digest/md5'

module Passages
  class RouteCollection
    include Enumerable

    attr_reader :routes

    def initialize(_routes)
      @routes = _routes.reject { |r| r.internal? }
    end

    def each(&block)
      Array(routes).each(&block)
    end

    def cache_key
      "routes/" + Digest::MD5.hexdigest(@routes.to_a.to_s)
    end

    private

    def main_app_name
      Rails.application.class.name
    end
  end
end
