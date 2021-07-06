class RaceRegistration < ApplicationRecord
  acts_as_paranoid

  belongs_to :boat_class
  belongs_to :usts_registration
  belongs_to :race
  belongs_to :creator, class_name: "User"

  validates :race, presence: true
  validates :creator, presence: true
  validates :usts_registration, presence: true
  validates :boat_number, presence: true
  validates :boat_class, presence: true
  validates :boat_class, uniqueness: { scope: [:usts_registration, :race], message: "has already been registered for this driver and race location" }

  scope :for_user, -> (user) { where(creator_id: user.id)}
  scope :unpaid_registrations, -> {where(paid: 0)}
  scope :for_future_races, -> { where(race: Race.future) }
  scope :for_past_races, -> { where(race: Race.past) }
  scope :for_races_this_year, -> { where(race: Race.races_this_year) }

  enum paid: [:unpaid, :pending, :paid]

  def self.to_csv
    CSV.generate do |csv|
      csv << %w{id
                year
                race_city
                race_state
                race_title
                driver_first_name
                driver_last_name
                driver_usts_number
                boat_class
                boat_number
                boat_name
                boat_owner
                boat_owner_zip
                emergency_contact
                emergency_phone
                emergency_contact_at_race
                paid?
                transaction_number
                payment_date
                payer_email
                payer_id
                creator_first_name
                creator_last_name
                created_at
                }
      for_races_this_year.each do |race_reg|
        csv << [race_reg.id,
                race_reg.race.start_date.year,
                race_reg.race.city,
                race_reg.race.state,
                race_reg.race.title,
                race_reg.usts_registration.first_name,
                race_reg.usts_registration.last_name,
                race_reg.usts_registration.usts_number,
                race_reg.boat_class.class_name,
                race_reg.boat_number,
                race_reg.boat_name,
                race_reg.boat_owner,
                race_reg.boat_owner_zip,
                race_reg.emergency_contact,
                race_reg.emergency_phone,
                race_reg.emergency_contact_at_race,
                race_reg.paid,
                race_reg.transaction_number,
                race_reg.payment_date,
                race_reg.payer_email,
                race_reg.payer_id,
                race_reg.creator.try(:first_name),
                race_reg.creator.try(:last_name),
                race_reg.created_at
                ]
      end
    end
  end

  def self.unpaid_race_reg(user)
    RaceRegistration.for_user(user).unpaid_registrations.for_future_races
  end

  def race_fee_override
     if race.fee_override?
       if boat_class.class_name == "KPro"
         return 25
       elsif boat_class.class_name.downcase.include?('depue only')
         boat_class.registration_fee
       else
       race.fee_override
       end
     else
       boat_class.registration_fee
     end
  end

end
