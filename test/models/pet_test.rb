require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test 'it has a User user' do
    user = User.new
    pet = Address.new user: user

    assert_equal pet.user, user
  end
end
