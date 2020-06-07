module Api
  module JsonPlaceholder
    class Client
      API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze

      def initialize(api_endpoint = nil)
        @api_endpoint = api_endpoint || API_ENDPOINT
      end

      def users
        request(
          http_method: :get,
          endpoint: 'users'
        )
      end

      def posts
        request(
          http_method: :get,
          endpoint: 'posts'
        )
      end

      def comments
        request(
          http_method: :get,
          endpoint: 'comments'
        )
      end

      private

        attr_reader :api_endpoint

        def request(http_method:, endpoint:, params: {})
          request = Typhoeus::Request.new(
            "#{api_endpoint}/#{endpoint}",
            method: http_method,
            params: params,
            headers: headers
          )

          response = request.run
          JSON.parse(response.body)
        end

        def headers
          {
            Accept: 'application/json',
            'Content-Type' => 'application/json'
          }
        end
    end
  end
end
