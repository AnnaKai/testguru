class Question < ApplicationRecord
  belongs_to :test, required: false
  has_many :answers

  validates :body, presence: true
end
