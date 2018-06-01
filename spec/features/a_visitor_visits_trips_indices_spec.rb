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
          expect(page).to have_link(trip.name)
          click_on(trip.name)
          expect(current_path).to eq(trip_path(trip))
          visit trips_path
        end
      end
      it 'should contain links to each trip page' do
        @trip1 = Trip.create!(name:'some trip')
        @trip2 = Trip.create!(name:'some other trip')

        visit trips_path

        click_on(@trip1.name)
        
        expect(current_path).to eq(trip_path(@trip1))
      end
    end
  end
end
