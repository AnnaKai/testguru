class User < ApplicationRecord

  devise :database_authenticatable,
         :lockable,
         :registerable,
         :recoverable,
         :rememberable,
         :timeoutable,
         :trackable,
         :omniauthable,
         :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :user_id
  has_many :gists

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :username

  def tests_by_level(level)
    tests.where("level = ?", level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

