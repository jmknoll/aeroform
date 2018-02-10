class User < ApplicationRecord
  include Clearance::User

  validates :password, length: { minimum: 8 }

  def confirm_email
    self.email_confirmed_at = Time.now
    save
  end

end

