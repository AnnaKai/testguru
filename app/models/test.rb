class Test < ApplicationRecord
  belongs_to :category

  def self.sorted_by_title(category_title)
    where("title = ?", category_title).order(id: :desc)
  end
end
