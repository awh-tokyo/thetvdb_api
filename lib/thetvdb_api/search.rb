class ThetvdbApi::Search < ThetvdbApi::Base
  include Ov

  # Find the series data based on its name.
  #
  # access: FREE
  # param:
  #   get_series('buffy')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeries
  let :get_series, String do |seriesname|
    get_series(seriesname: seriesname)
  end

  # Find the series data based on its name.
  #
  # access: FREE
  # param:
  #   get_series('buffy', 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeries
  let :get_series, String, String do |seriesname, language|
    get_series(seriesname: seriesname, language: language)
  end

  # Find the series data based on its name.
  #
  # access: FREE
  # param:
  #   get_series(seriesname: 'buffy')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeries
  let :get_series, Hash do |options|
    get_series_path_with_params(options).get
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param:
  #   get_series_url('buffy')
  # output: url string
  let :get_series_url, String do |series|
    get_series_url(seriesname: series)
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param:
  #   get_series_url('buffy', 'de')
  # output: url string
  let :get_series_url, String, String do |series, language|
    get_series_url(seriesname: series, language: language)
  end

  # Find the series data based on its name - return only url.
  #
  # access: FREE
  # param:
  #   get_series_url(seriesname: 1234)
  # output: url string
  let :get_series_url, Hash do |options|
    get_series_path_with_params(options).url
  end

  # Find the series data by unique ID's used on other sites.
  #
  # access: FREE
  # param: options hash
  #   imdbid: IMDb ID (don't use with zap2itid)
  #   zap2it: Zap2it ID (don't use with imdbid)
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  let :get_series_by_remote_id, Hash do |options|
    get_series_by_remote_id_path_with_params(options).get
  end

  # Find the series data by unique ID's used on other sites - return only url.
  #
  # access: FREE
  # param: options hash
  #   imdbid: IMDb ID (don't use with zap2itid)
  #   zap2itid: Zap2it ID (don't use with imdbid)
  # output: url string
  let :get_series_by_remote_id_url, Hash do |options|
    get_series_by_remote_id_path_with_params(options).url
  end

  # Find the series data by unique IMDB ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id('tt01234')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  let :get_series_by_imdb_id, String do |imdb_id|
    get_series_by_remote_id_path_with_params(imdbid: imdb_id).get
  end

  # Find the series data by unique IMDB ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id('tt01234', 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  let :get_series_by_imdb_id, String, String do |imdb_id, language|
    get_series_by_remote_id_path_with_params(imdbid: imdb_id, language: language).get
  end

  # Find the series data by unique IMDB ID - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id_url('tt01234')
  # output: url string
  let :get_series_by_imdb_id_url, String do |imdb_id|
    get_series_by_remote_id_path_with_params(imdbid: imdb_id).url
  end

  # Find the series data by unique IMDB ID - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_imdb_id_url('tt01234')
  # output: url string
  let :get_series_by_imdb_id_url, String, String do |imdb_id, language|
    get_series_by_remote_id_path_with_params(imdbid: imdb_id, language: language).url
  end

  # Find the series data by unique zap2it ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_zap2it_id('SH01234')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  let :get_series_by_zap2it_id, String do |zap2it_id|
    get_series_by_remote_id_path_with_params(zap2itid: zap2it_id).get
  end

  # Find the series data by unique zap2it ID
  #
  # access: FREE
  # param (flat params):
  #   get_series_by_zap2it_id('SH01234', 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetSeriesByRemoteID
  let :get_series_by_zap2it_id, String, String do |zap2it_id, language|
    get_series_by_remote_id_path_with_params(zap2itid: zap2it_id, language: language).get
  end

  # Find the series data by unique zap2it ID - return only url.
  #
  # access: FREE
  # param: options hash
  #   get_series_by_zap2it_id_url('SH01234')
  # output: url string
  let :get_series_by_zap2it_id_url, String do |zap2it_id|
    get_series_by_remote_id_path_with_params(zap2itid: zap2it_id).url
  end

  # Find the series data by unique zap2it ID - return only url.
  #
  # access: FREE
  # param: options hash
  #   get_series_by_zap2it_id_url('SH01234', 'de')
  # output: url string
  let :get_series_by_zap2it_id_url, String, String do |zap2it_id, language|
    get_series_by_remote_id_path_with_params(zap2itid: zap2it_id, language: language).url
  end

  # Find the episode data by episode air date.
  #
  # access: FREE
  # param (flat params):
  #   get_episode(1234, '2000-01-01')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate
  let :get_episode, Any, String do |series_id, air_date|
    get_episode(seriesid: series_id, airdate: air_date)
  end

  # Find the episode data by episode air date.
  #
  # access: FREE
  # param (flat params):
  #   get_episode(1234, '2000-01-01', 'de')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate
  let :get_episode, Any, String, String do |series_id, air_date, language|
    get_episode(seriesid: series_id, airdate: air_date, language: language)
  end

  # Find the episode data by episode air date.
  #
  # access: FREE
  # param (hash params):
  #   get_episode(seriesid: 1234, airdate: '2000-01-01')
  # output: Faraday::Response instance with parsed XML string
  # example: http://thetvdb.com/wiki/index.php/API:GetEpisodeByAirDate
  let :get_episode, Hash do |options|
    get_episode_path_with_params(options).get
  end

  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_episode_url(1234, '2000-01-01')
  # output: url string
  let :get_episode_url, Any, String do |series_id, air_date|
    get_episode_url(seriesid: series_id, airdate: air_date)
  end

  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param (flat params):
  #   get_episode_url(1234, '2000-01-01', 'de')
  # output: url string
  let :get_episode_url, Any, String, String do |series_id, air_date, language|
    get_episode_url(seriesid: series_id, airdate: air_date, language: language)
  end

  # Find the episode data by episode air date - return only url.
  #
  # access: FREE
  # param (hash params):
  #   get_episode_url(seriesid: 1234, airdate: '2000-01-01')
  # output: url string
  let :get_episode_url, Hash do |options|
    get_episode_path_with_params(options).url
  end

  private

  def get_series_path_with_params(options)
    path(get_series_path).params(language_options.merge(options))
  end

  def get_series_path
    'GetSeries.php'
  end

  def get_series_by_remote_id_path_with_params(options)
    path(get_series_by_remote_id_path).params(language_options.merge(options))
  end

  def get_series_by_remote_id_path
    'GetSeriesByRemoteID.php'
  end

  def get_episode_path_with_params(options)
    path(get_episode_path).params(api_key_with_language_options.merge(options))
  end

  def get_episode_path
    'GetEpisodeByAirDate.php'
  end
end
