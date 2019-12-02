class AddressesControllerTest < ActionDispatch::IntegrationTest
  test 'GET new_with_user shows a form for the address with nested user attributes' do
    get new_with_user_addresses_path
    assert_response :success

    assert_select 'form.address_form_with_user' do
      assert_select 'input#address_user_attributes_name'
      assert_select 'input#address_user_attributes_lastname'
      assert_select 'input#address_user_attributes_email'
    end
  end

  test 'POST new_with_address creates a user with nested address attributes' do
    assert_equal 0, User.count
    assert_equal 0, Address.count

    address_params = {
      address: {
        street: 'Fake Street',
        number: '123',
        zip_code: '0',
        user_attributes: {
          name: 'John',
          lastname: 'Doe',
          email: 'email@test.com'
        }
      }
    }

    post new_with_user_addresses_path, params: address_params

    assert_equal 1, User.count
    assert_equal 1, Address.count

    assert_redirected_to action: :show, id: Address.first.id

    a = Address.first
    u = a.user

    assert_equal 'John', u.name
    assert_equal 'Doe', u.lastname
    assert_equal 'email@test.com', u.email
    assert_equal 'Fake Street', a.street
    assert_equal '0', a.zip_code
    assert_equal '123', a.number
  end
end
