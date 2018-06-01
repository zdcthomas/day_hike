require 'rails_helper'

RSpec.feature "VisitorVisitsTrailShows", type: :feature do
  describe 'A Visitor' do
    context 'visiting the trail show page' do
      it 'should see he name, address, and total length of every hiking trip that includes this trail' do
        @trip1 = Trip.create!(name:'some trip')
        @trip2 = Trip.create!(name:'another trip')
        @trip3 = Trip.create!(name:'wow, more trips')
        @trip4 = Trip.create!(name:'hey another trip')
        @trail = @trip1.trails.create!(length:3, name:'another trail', address:'123 asdf')
        TripTrail.create!(trip_id:@trip2.id, trail_id:@trail.id)
        TripTrail.create!(trip_id:@trip3.id, trail_id:@trail.id)
        TripTrail.create!(trip_id:@trip4.id, trail_id:@trail.id)

        visit trail_path(@trail)

        expect(page).to have_content(@trail.address)
        @trail.trips.each do |trip|
          expect(page).to have_content(trip.total_trail_length)
          expect(page).to have_content(trip.name)
        end

      end
    end
  end
end
