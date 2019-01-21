class FormMail < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :recipient, presence: true
  validates :body, presence: true
end
