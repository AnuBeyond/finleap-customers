require 'rails_helper'

RSpec.describe DistanceCalculator do

  before(:each) do
    @customers = [{"user_id"=>4, "name"=>"Ernesto Breitenberg", "latitude"=>52.94260786195436, "longitude"=>13.067312769068188},
      {"user_id"=>3, "name"=>"Mary Pacocha III", "latitude"=>54.40558241539176, "longitude"=>11.910683608777204}]
  end

  describe 'find points' do
    context 'when no distance given' do
      it 'returns within 100Km' do
        expect(DistanceCalculator.call(@customers).count).to eq(1)
      end
    end

    context 'when none within distance' do
      it 'returns empty' do
        expect(DistanceCalculator.call(@customers, 1).count).to eq(0)
      end
    end

    context 'when empty data given' do
      it 'returns empty' do
        expect(DistanceCalculator.call([], 1).count).to eq(0)
      end
    end

  end
end
