require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'it has a User user' do
    user = User.new
    address = Address.new user: user

    assert_equal address.user, user
  end

  test 'it adds attributes for the user' do
    address = Address.new
    address.user_attributes = { name: 'John', lastname: 'Doe', email: 'email@test.com' }

    assert_equal address.user.name, 'John'
    assert_equal address.user.lastname, 'Doe'
    assert_equal address.user.email, 'email@test.com'
  end
end
