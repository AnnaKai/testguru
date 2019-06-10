class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions
  has_many :test_passes
  has_many :users, through: :test_passes

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  scope :sorted_by_title, ->(title) { joins(:category).where("title = ?", title).order(id: :desc).pluck(:title) }

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates_uniqueness_of :title, :scope => :level

end
