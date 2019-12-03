require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it has an Address address' do
    address = Address.new
    user = User.new address: address

    assert_equal user.address, address
  end

  test 'it adds attributes for the address' do
    user = User.new
    user.address_attributes = { street: 'Fake Street', number: '123', zip_code: '0' }

    assert_equal user.address.street, 'Fake Street'
    assert_equal user.address.number, '123'
    assert_equal user.address.zip_code, '0'
  end

  test 'it has pets' do
    user = User.new

    user.pets << Pet.new(name: 'Spike', species: 'Dog')
    user.pets << Pet.new(name: 'Garfield', species: 'Cat')

    assert_equal user.pets.size, 2
    assert_equal user.pets[0].name, 'Spike'
    assert_equal user.pets[1].species, 'Cat'
  end
end
