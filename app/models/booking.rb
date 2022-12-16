class Booking < ApplicationRecord
  belongs_to :listing
  after_create_commit :first_checkin
  after_create_commit :last_checkout

  private

  def first_checkin
    Mission.create!(
      listing_id: listing.id,
      date: start_date,
      price: 10 * listing.num_rooms,
      mission_type: 0
    )
  end

  def last_checkout
    Mission.create!(
      listing_id: listing.id,
      date: end_date,
      price: 10 * listing.num_rooms,
      mission_type: 1
    )
  end
end
