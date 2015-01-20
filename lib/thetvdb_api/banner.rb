class ThetvdbApi::Banner < ThetvdbApi::Base
  include Ov

  # Return all of the series banners.
  #
  # access: FREE
  # param:
  #   find(1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:banners.xml
  let :find, Any do |series_id|
    find(series_id: series_id)
  end

  # Return all of the series banners.
  #
  # access: FREE
  # param:
  #   find(series_id: 1234)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:banners.xml
  let :find, Hash do |options|
    find_path_with_params(options).get
  end

  # Return all of the series banners - return only url.
  #
  # access: FREE
  # param:
  #   find_url(1234)
  # output: url string
  let :find_url, Any do |series_id|
    find_url(series_id: series_id)
  end

  # Return all of the series banners - return only url.
  #
  # access: FREE
  # param:
  #   find_url(series_id: 1234)
  # output: url string
  let :find_url, Hash do |options|
    find_path_with_params(options).url
  end

  private

  def find_path_with_params(options)
    path(find_path).params(api_key_options.merge(options))
  end

  def find_path
    ':apikey/series/:series_id/banners.xml'
  end
end
