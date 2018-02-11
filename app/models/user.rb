class User < ApplicationRecord
  include Clearance::User

  validates :password, length: { minimum: 8 }, :on => :create

  has_one :api_key

  def confirm_email
    self.email_confirmed_at = Time.current
    save
  end

end

