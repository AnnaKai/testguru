class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question, required: false

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :check_answers_max_limit

  private

  def check_answers_max_limit
    errors.add(:max_limit, "Question can't have more than #{MAX_ANSWERS} answers") if question.answers.size >= MAX_ANSWERS
  end
end
