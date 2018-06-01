require 'rails_helper'

RSpec.feature "AVisitorVisitsTripsIndices", type: :feature do
  describe 'A visitor' do
    context 'visiting the trips index page' do
      it 'should show a list of all trip names' do
        @trip1 = Trip.create!(name:'some trip')
        @trip2 = Trip.create!(name:'some other trip')
        @trip3 = Trip.create!(name:'yet another trip')
        @trip4 = Trip.create!(name:'wow, more trips')
        @trip5 = Trip.create!(name:'a simple trip')

        visit trips_path

        Trip.all.each do |trip|
          expect(page).to have_content(trip.name)
        end
      end
    end
  end
end
