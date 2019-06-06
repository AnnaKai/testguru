class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passes
  has_many :users, through: :test_passes

  def self.sorted_by_title(category_title)
    joins(:category).where("title = ?", category_title).order(id: :desc).pluck(:title)
  end
end
