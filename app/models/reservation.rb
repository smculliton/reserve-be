class Reservation < ApplicationRecord
  validates_presence_of :email, :party_size, :time
end
