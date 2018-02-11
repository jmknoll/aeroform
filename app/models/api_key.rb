class ApiKey < ApplicationRecord
  belongs_to :user

  def self.generator
    SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
