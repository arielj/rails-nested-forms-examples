require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it has an Address address' do
    address = Address.new
    user = User.new address: address

    assert user.address, address
  end

  test 'it adds attributes for the address' do
    user = User.new
    user.address_attributes = { street: 'Fake Street', number: '123', zip_code: '0' }

    assert user.address.street, 'Fake Street'
    assert user.address.number, '123'
    assert user.address.zip_code, '0'
  end
end
