require 'spec_helper'

describe ThetvdbApi::Client do
  let(:client) { ThetvdbApi::Client.new }

  describe 'real request' do
    describe '.search' do
      describe '.get_series' do
        it 'should return response class' do
          client.search.get_series('buffy').class.should == ThetvdbApi::Response::SearchMultipleSeries
        end
      end

      describe '.get_series_by_imdb_id' do
        it 'should return response class' do
          client.search.get_series_by_imdb_id('tt0118276').class.should == ThetvdbApi::Response::SearchSeries
        end
      end

      describe '.get_series_by_zap2it_id' do
        it 'should return response class' do
          client.search.get_series_by_zap2it_id('EP00213110').class.should == ThetvdbApi::Response::SearchSeries
        end
      end

      describe '.get_episode' do
        it 'should return response class' do
          client.search.get_episode('70327','1997-03-10').class.should == ThetvdbApi::Response::SearchMultipleEpisode
        end
      end
    end

    describe '.series' do
      describe '.find' do
        it 'should return response class' do
          client.series.find('70327').class.should == ThetvdbApi::Response::Series
        end
      end

      describe '.find_full' do
        it 'should return response class' do
          client.series.find_full('70327').class.should == ThetvdbApi::Response::FullSeries
        end
      end
    end

    describe '.actor' do
      describe '.find' do
        it 'should return response class' do
          client.actor.find('70327').class.should == ThetvdbApi::Response::Actors
        end
      end
    end

    describe '.banner' do
      describe '.find' do
        it 'should return response class' do
          client.banner.find('70327').class.should == ThetvdbApi::Response::Banners
        end
      end
    end

    describe '.episode' do
      describe '.find_by_default_order' do
        it 'should return response class' do
          client.episode.find_by_default_order('70327', '1', '1').class.should == ThetvdbApi::Response::Episode
        end
      end

      describe '.find_by_dvd_order' do
        it 'should return response class' do
          client.episode.find_by_dvd_order('70327', '1', '1').class.should == ThetvdbApi::Response::Episode
        end
      end

      describe '.find_by_absolute_order' do
        it 'should return response class' do
          client.episode.find_by_absolute_order('70327', '1').class.should == ThetvdbApi::Response::Episode
        end
      end

      describe '.find' do
        it 'should return response class' do
          client.episode.find('533011').class.should == ThetvdbApi::Response::Episode
        end
      end
    end

    describe '.update' do
      describe '.day' do
        it 'should return response class' do
          client.update.day.class.should == ThetvdbApi::Response::Update
        end
      end

      describe '.week' do
        it 'should return response class' do
          client.update.week.class.should == ThetvdbApi::Response::Update
        end
      end

      describe '.month' do
        it 'should return response class' do
          client.update.month.class.should == ThetvdbApi::Response::Update
        end
      end
    end
  end
end