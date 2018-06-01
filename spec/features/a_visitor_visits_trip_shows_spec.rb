require 'rails_helper'

RSpec.feature "AVisitorVisitsTripShows", type: :feature do
  describe 'A visitor' do
    context 'visiting the trip show page' do
      it 'should have a list of the related trails along iwth the name, address, and length of each trail' do
        @trip1 = Trip.create!(name:'some trip')
        @trip1.trails.create!(length:3, name:'happy',address:'123 asdf')
        @trip1.trails.create!(length:4, name:'sad',address:'123 fds')
        @trip1.trails.create!(length:6, name:'mediocre',address:'124 asdf')

        visit trip_path(@trip1)

        expect(page).to have_content(@trip1.total_trail_length)
        expect(page).to have_content(@trip1.average_trail_length)
        expect(page).to have_content(@trip1.max_trail_length)
        expect(page).to have_content(@trip1.min_trail_length)

        @trip1.trails.each do |trail|
          expect(page).to have_content(trail.name)
          expect(page).to have_content(trail.length)
          expect(page).to have_content(trail.address)
          expect(page).to have_link(trail.name)
          click_on(trail.name)
          expect(current_path).to eq(trail_path(trail))
          visit(trip_path(@trip1))
        end
      end
    end
  end
end
