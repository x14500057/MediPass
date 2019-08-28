class UserDecorator < BaseDecorator
  def fullname
    "#{firstname} #{surname}"
  end
end