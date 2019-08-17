class Patient < ApplicationRecord
  belongs_to :user
  has_many :medical_records, dependent: :destroy
end
