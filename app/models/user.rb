class User < ApplicationRecord

  has_many :test_passes
  has_many :tests, through: :test_passes
  has_many :created_tests, class_name: "Test"

  def tests_by_level(level)
    tests.where("level = ?", level)
  end
end
