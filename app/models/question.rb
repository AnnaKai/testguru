class Question < ApplicationRecord
  belongs_to :test, required: false
  has_many :answers
  has_many :gists

  validates :body, presence: true
end
