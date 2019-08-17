class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum role: [:patient, :doctor, :admin]
  # enum role: [:patient, :doctor, :admin]

  enum role: { admin: "admin", doctor: "doctor", patient: "patient"}



#   after_initialize do
#   if self.new_record?
#     self.role ||= :patient
#   end
# end

  has_one :patient
  has_one :doctor
end
