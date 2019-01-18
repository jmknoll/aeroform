class FormMail < ApplicationRecord
  belongs_to :user

  validates :recipient, presence: true
  validates :body, presence: true
end
