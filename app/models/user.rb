class User < ApplicationRecord

  def tests_by_level(level)
    # select all the test id which belong to the user
    user_tests = TestPass.where("user_id = ?", id)
    # select all the tests by their id and sort them by their level
    Test.where(id: user_tests).where("level = ?", level)
  end
end
