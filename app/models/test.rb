class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.sorted_by_title(category_title)
    where("title = ?", category_title).order(id: :desc)
  end
end
