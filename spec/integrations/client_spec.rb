require 'spec_helper'

describe ThetvdbApi::Client do
  let(:client) { ThetvdbApi::Client.new }

  describe 'real request' do
    describe '.search' do
      describe '.get_series' do
        it 'should return hash' do
          client.search.get_series('buffy').class.should == Hash
        end
      end

      describe '.get_series_by_imdb_id' do
        it 'should return hash' do
          client.search.get_series_by_imdb_id('tt0118276').class.should == Hash
        end
      end

      describe '.get_series_by_zap2it_id' do
        it 'should return hash' do
          client.search.get_series_by_zap2it_id('EP00213110').class.should == Hash
        end
      end

      describe '.get_episode_by_air_date' do
        it 'should return hash' do
          client.search.get_episode_by_air_date('70327','1997-03-10').class.should == Hash
        end
      end
    end
  end
end
