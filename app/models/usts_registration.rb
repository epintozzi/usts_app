class UstsRegistration < ApplicationRecord
  acts_as_paranoid

  belongs_to :creator, class_name: "User"
  has_many :race_registrations

  validates :race_year, presence: true, length: { is: 4 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :usts_number, presence: true, unless: :nonracing?
  validates :usts_number, uniqueness: { scope: [:race_year], message: "has already been registered for this race year" }, unless: :nonracing?
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :birthdate, presence: true
  validates :liability_release, presence: true, inclusion: { in: [true] }
  validates :membership_type, presence: true
  validates :signature, presence: true

  scope :for_user, -> (user) { where(creator_id: user.id)}
  scope :unpaid_registrations, -> { where(paid: 0)}
  scope :usts_registrations_this_year, -> { where(race_year: Date.today.year) }
  scope :future_usts_registrations, -> { where('race_year >= ?', Date.today.year) }

  enum membership_type: [:nonracing, :racing, :kpro]
  enum paid: [:unpaid, :pending, :paid]

  def membership_prices
    {
      nonracing: 25,
      racing: 100,
      kpro: 25
    }
  end

  def self.full_name_list
    name_list = []
    order(first_name: :asc).all.each do |registrant|
      user_and_name = ["#{registrant.first_name} #{registrant.last_name}", registrant.id]
      name_list << user_and_name
    end
    return name_list
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      result_hash = row.to_hash
      result_hash["race_year"] = result_hash["race_year"].to_i
      UstsRegistration.create!(result_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << %w{id
                year
                member_first_name
                member_last_name
                member_usts_number
                membership_type
                street_address
                city
                state
                zip
                email
                phone
                fax
                birthdate
                read_waiver?
                typed_signature
                paid?
                transaction_number
                payment_date
                payer_email
                payer_id
                creator_first_name
                creator_last_name
                created_at
                }
      all.each do |usts_reg|
        csv << [usts_reg.id,
                usts_reg.race_year,
                usts_reg.first_name,
                usts_reg.last_name,
                usts_reg.usts_number,
                usts_reg.membership_type,
                usts_reg.street_address,
                usts_reg.city,
                usts_reg.state,
                usts_reg.zip,
                usts_reg.email,
                usts_reg.phone,
                usts_reg.fax,
                usts_reg.birthdate,
                usts_reg.liability_release,
                usts_reg.signature,
                usts_reg.paid,
                usts_reg.transaction_number,
                usts_reg.payment_date,
                usts_reg.payer_email,
                usts_reg.payer_id,
                usts_reg.creator.try(:first_name),
                usts_reg.creator.try(:last_name),
                usts_reg.created_at
                ]
      end
    end
  end

  def self.unpaid_usts_reg(user)
      UstsRegistration.for_user(user).unpaid_registrations.future_usts_registrations
  end

end
