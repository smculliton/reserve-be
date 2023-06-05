require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:party_size) }
  end

  describe 'class methods' do 
    before(:each) do 
      @res1 = Reservation.create!(email: 'scull@att.net', time: DateTime.now, party_size: 6)
      @res2 = Reservation.create!(email: 'scull@att.net', time: DateTime.now + 7, party_size: 6)
    end

    describe '#by_week' do 
      it 'returns reservations based on week relative to this week' do
        expect(Reservation.by_week(0)).to eq([@res1])
        expect(Reservation.by_week(1)).to eq([@res2])
      end
    end

    describe '#by_day' do 
      it 'returns reservations based on day of given date time' do 
        date = DateTime.now

        expect(Reservation.by_day(date)).to eq([@res1])
        expect(Reservation.by_day(date + 1)).to eq([])
        expect(Reservation.by_day(date + 7)).to eq([@res2])
      end
    end
  end
end