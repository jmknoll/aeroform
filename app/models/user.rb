class User < ApplicationRecord
  include Clearance::User

  validates :password, length: { minimum: 8 }
end

