require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'instance methods' do
    describe 'total_trail_length' do
      it 'should return the total lenght of all the trails for a trip' do
        @trip1 = Trip.create!(name:'some trip')
        @trip1.trails.create!(length:3, name:'happy',address:'123 asdf')
        @trip1.trails.create!(length:4, name:'sad',address:'123 fds')
        @trip1.trails.create!(length:6, name:'mediocre',address:'124 asdf')

        expect(@trip1.total_trail_length).to eq(13)
      end
    end
    describe 'average_trail_length' do
      it 'should return the average trail lenght for all trails on a trip' do
        @trip1 = Trip.create!(name:'some trip')
        @trip1.trails.create!(length:3, name:'happy',address:'123 asdf')
        @trip1.trails.create!(length:4, name:'sad',address:'123 fds')
        @trip1.trails.create!(length:6, name:'mediocre',address:'124 asdf')

        expect(@trip1.average_trail_length).to eq(4.33)

      end
    end
    describe 'max trail length' do 
      it 'should return the maximum trail lenght for that trip' do
        @trip1 = Trip.create!(name:'some trip')
        @trip1.trails.create!(length:3, name:'happy',address:'123 asdf')
        @trip1.trails.create!(length:4, name:'sad',address:'123 fds')
        @trip1.trails.create!(length:6, name:'mediocre',address:'124 asdf')

        expect(@trip1.max_trail_length).to eq(6)
      end
    end
    describe 'max trail length' do 
      it 'should return the minimum trail lenght for that trip' do
        @trip1 = Trip.create!(name:'some trip')
        @trip1.trails.create!(length:3, name:'happy',address:'123 asdf')
        @trip1.trails.create!(length:4, name:'sad',address:'123 fds')
        @trip1.trails.create!(length:6, name:'mediocre',address:'124 asdf')

        expect(@trip1.min_trail_length).to eq(3)
      end
    end
  end
end
