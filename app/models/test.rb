class Test < ApplicationRecord
  belongs_to :category, required: false
  belongs_to :author, class_name: "User", required: false

  has_many :questions
  has_many :test_passes
  has_many :users, through: :test_passes

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  scope :joined_categories, ->(title) { joins(:category).where("title = ?", title) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  def sorted_by_title(title)
    joined_categories(title).order(id: :desc).pluck(:title)
  end

end
