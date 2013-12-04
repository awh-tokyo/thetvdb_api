require 'httparty'

class ThetvdbApi::Request::Base
  include HTTParty

  attr_reader :uri

  def self.api_key
    ThetvdbApi::Configuration.api_key
  end

  def initialize(uri)
    @uri = uri
  end

  def response
    @response ||= self.class.get(uri, request_options)
  end

  def request_options(options = {})
    {
      query: options,
      base_uri: ThetvdbApi::Configuration.api_url
    }
  end

  def collection_response(key, klass)
    response_condition? ? array_mapped(klass, key) : []
  end

  def object_response(key, klass)
    response_condition? ? klass.new(data[key]) : nil
  end

  def response_condition?
    response.code == 200 && data.is_a?(Hash)
  end

  def array_normalize(key)
    dig(key).is_a?(Array) ? dig(key) : [dig(key)]
  end

  def array_mapped(klass, key)
    array_normalize(key).map { |data| klass.new(data) }
  end

  def dig(key)
    data[key]
  end

  def data
    response[data_key]
  end

  private

  def data_key
    'Data'
  end

  def map_node
    {
      series: 'Series',
      episode: 'Episode'
    }
  end

  def map_class
    {
      series: ThetvdbApi::Series,
      episode: ThetvdbApi::Episode
    }
  end
end
