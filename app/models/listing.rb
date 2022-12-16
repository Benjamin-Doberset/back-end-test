class Listing < ApplicationRecord
  has_many :booking
  has_many :mission
  has_many :reservation
end
