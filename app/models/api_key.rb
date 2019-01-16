
class ApiKey < ApplicationRecord  
  belongs_to :user

  def self.generator
    SecureRandom.hex(12)
  end
end
