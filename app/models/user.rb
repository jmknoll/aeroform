class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true, uniqueness: true
end
