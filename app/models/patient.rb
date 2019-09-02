class Patient < ApplicationRecord
  belongs_to :user
  has_many :allergies
  has_many :medical_records, dependent: :destroy 

  validates :firstname, presence:true, length: {minimum: 3, maximum: 15}
  validates :surname, presence:true, length: {minimum: 3, maximum: 15}
  validates :address, presence:true, length: {minimum: 10, maximum: 100}
  validates_format_of :phone_number, :with => /\(?[0-9]{10}/,   :message => "- Phone numbers must be 10 digits long, in 08XXXXXXX format." 

  scope :search, -> (search) do
    where("firstname ILIKE lower(?) OR surname ILIKE lower(?) OR surname ILIKE lower(?)", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

