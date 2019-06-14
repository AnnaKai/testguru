class TestPass < ApplicationRecord
  self.table_name = "tests_users"
  belongs_to :test, required: false
  belongs_to :user, required: false
end
