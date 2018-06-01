require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'instance methods' do
    describe 'trip_count' do
      it 'should return the total number of trips this trail is a part of' do
        @trip1 = Trip.create!(name:'some trip')
        @trip2 = Trip.create!(name:'another trip')
        @trip3 = Trip.create!(name:'wow, more trips')
        @trip4 = Trip.create!(name:'hey another trip')
        @trail = @trip1.trails.create!(length:3, name:'another trail', address:'123 asdf')
        TripTrail.create!(trip_id:@trip2.id, trail_id:@trail.id)
        TripTrail.create!(trip_id:@trip3.id, trail_id:@trail.id)
        TripTrail.create!(trip_id:@trip4.id, trail_id:@trail.id)

        expect(@trail.trip_count).to eq(4)
      end
    end
  end
end
