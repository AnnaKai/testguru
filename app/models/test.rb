class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passes
  has_many :users, through: :test_passes

  def self.sorted_by_title(category_title)
    where("title = ?", category_title).order(id: :desc)
  end
end
