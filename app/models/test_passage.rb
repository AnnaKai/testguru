class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :set_first_question, on: :create
  before_update :set_next_question

  def complete?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  # count questions which are less or equal than current one
  def question_num
    test.questions.order(:id).where("id <= ?", current_question.id).count
  end

  def success_rate
    correct_questions.to_f / test.questions.count * 100
  end

  def passed?
    success_rate > SUCCESS_PERCENT
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers_count == correct_answers.where(id: answer_ids).count && correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end

end
