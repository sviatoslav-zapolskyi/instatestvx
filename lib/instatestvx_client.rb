require 'faraday'
require 'faraday_middleware'

module InstatestvxMe
  class Client

    def initialize
      @conn = Faraday.new(url: base_url) do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end

    def login(login, password)
      @conn.post do |req|
        req.url '/api/auth/login'
        req.body = { login: login, password: password }
      end
    end

    private

    def base_url
      'http://instatestvx.me'
    end
  end
end
