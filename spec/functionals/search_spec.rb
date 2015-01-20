require 'spec_helper'

describe ThetvdbApi::Search do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.search }

  let(:get_series_data) { File.read('spec/fixtures/get_series.xml') }
  let(:get_series_by_remote_data) { File.read('spec/fixtures/get_series_by_remote.xml') }
  let(:get_episode_data) { File.read('spec/fixtures/get_episode.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/GetSeries.php?language=en&seriesname=Supernatural') { [200, { content_type: 'xml' }, get_series_data] }
      stub.get('/api/GetSeries.php?language=de&seriesname=Supernatural') { [200, { content_type: 'xml' }, get_series_data] }
      stub.get('/api/GetSeriesByRemoteID.php?language=en&imdbid=tt0290978') { [200, { content_type: 'xml' }, get_series_by_remote_data] }
      stub.get('/api/GetSeriesByRemoteID.php?language=de&imdbid=tt0290978') { [200, { content_type: 'xml' }, get_series_by_remote_data] }
      stub.get('/api/GetSeriesByRemoteID.php?language=en&zap2it=SH01234') { [200, { content_type: 'xml' }, get_series_by_remote_data] }
      stub.get('/api/GetSeriesByRemoteID.php?language=de&zap2it=SH01234') { [200, { content_type: 'xml' }, get_series_by_remote_data] }
      stub.get('/api/GetEpisodeByAirDate.php?language=en&airdate=2007-09-24&apikey=123456789&seriesid=80348') do
        [200, { content_type: 'xml' }, get_episode_data]
      end
      stub.get('/api/GetEpisodeByAirDate.php?language=de&airdate=2007-09-24&apikey=123456789&seriesid=80348') do
        [200, { content_type: 'xml' }, get_episode_data]
      end
    end
  end
  
  describe '.get_series' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.get_series(name: 'Supernatural')).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.get_series(name: 'Supernatural').body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series('Supernatural')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series('Supernatural').body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series('Supernatural', 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series('Supernatural', 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.get_series_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.get_series_url(name: 'Supernatural')
        ).to eq('http://thetvdb.com/api/GetSeries.php?language=en&seriesname=Supernatural')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_url('Supernatural')
          ).to eq('http://thetvdb.com/api/GetSeries.php?language=en&seriesname=Supernatural')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_url('Supernatural', 'de')
          ).to eq('http://thetvdb.com/api/GetSeries.php?language=de&seriesname=Supernatural')
        end
      end
    end
  end

  describe '.get_series_by_remote_id' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.get_series_by_remote_id(imdb_id: 'tt0290978')).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.get_series_by_remote_id(imdb_id: 'tt0290978').body).to be_a(Hash)
      end
    end
  end

  describe '.get_series_by_remote_id_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.get_series_by_remote_id_url(imdb_id: 'tt0290978')
        ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=en&imdbid=tt0290978')
      end
    end
  end

  describe '.get_series_by_remote_id' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.get_series_by_remote_id(zap2it_id: 'SH01234')).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.get_series_by_remote_id(zap2it_id: 'SH01234').body).to be_a(Hash)
      end
    end
  end

  describe '.get_series_by_remote_id_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.get_series_by_remote_id_url(zap2it_id: 'SH01234')
        ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=en&zap2it=SH01234')
      end
    end
  end

  describe '.get_series_by_imdb_id' do
    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series_by_imdb_id('tt0290978')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series_by_imdb_id('tt0290978').body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series_by_imdb_id('tt0290978', 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series_by_imdb_id('tt0290978', 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.get_series_by_imdb_id_url' do
    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_by_imdb_id_url('tt0290978')
          ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=en&imdbid=tt0290978')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_by_imdb_id_url('tt0290978', 'de')
          ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=de&imdbid=tt0290978')
        end
      end
    end
  end

  describe '.get_series_by_zap2it_id' do
    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series_by_zap2it_id('SH01234')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series_by_zap2it_id('SH01234').body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_series_by_zap2it_id('SH01234', 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_series_by_zap2it_id('SH01234', 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.get_series_by_zap2it_id_url' do
    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_by_zap2it_id_url('SH01234')
          ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=en&zap2it=SH01234')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_series_by_zap2it_id_url('SH01234', 'de')
          ).to eq('http://thetvdb.com/api/GetSeriesByRemoteID.php?language=de&zap2it=SH01234')
        end
      end
    end
  end

  describe '.get_episode' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.get_episode(series_id: 80348, air_date: '2007-09-24')).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.get_episode(series_id: 80348, air_date: '2007-09-24').body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_episode(80348, '2007-09-24')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_episode(80348, '2007-09-24').body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.get_episode(80348, '2007-09-24', 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.get_episode(80348, '2007-09-24', 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.get_episode_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.get_episode_url(series_id: 80348, air_date: '2007-09-24')
        ).to eq('http://thetvdb.com/api/GetEpisodeByAirDate.php?apikey=123456789&language=en&seriesid=80348&airdate=2007-09-24')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_episode_url(80348, '2007-09-24')
          ).to eq('http://thetvdb.com/api/GetEpisodeByAirDate.php?apikey=123456789&language=en&seriesid=80348&airdate=2007-09-24')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.get_episode_url(80348, '2007-09-24', 'de')
          ).to eq('http://thetvdb.com/api/GetEpisodeByAirDate.php?apikey=123456789&language=de&seriesid=80348&airdate=2007-09-24')
        end
      end
    end
  end
end
