class ThetvdbApi::Client
  attr_reader :api_key, :api_url, :language

  def initialize(options = {})

    @api_key = options[:api_key] ? options[:api_key] : ThetvdbApi::Configuration.api_key
    @api_url = options[:api_url] ? options[:api_url] : ThetvdbApi::Configuration.api_url
    @language = options[:language] ? options[:language] : ThetvdbApi::Configuration.language
  end

  def search
    @search ||= ThetvdbApi::Search.new(self)
  end
end