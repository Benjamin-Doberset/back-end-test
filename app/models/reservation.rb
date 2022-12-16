class Reservation < ApplicationRecord
  belongs_to :listing
  after_create_commit :checkout_checkin

  def checkout_checkin
    unless listing.mission.find_by(date: end_date)
      Mission.create!(
        listing_id: listing.id,
        date: end_date,
        price: 5 * listing.num_rooms,
        mission_type: 2
      )
    end
  end
end
