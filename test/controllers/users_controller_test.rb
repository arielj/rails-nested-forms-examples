class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'GET new_with_address shows a form for the user with nested address attributes' do
    get new_with_address_users_path
    assert_response :success
    assert_select 'form.user_form_with_address' do
      assert_select 'input#user_address_attributes_street'
      assert_select 'input#user_address_attributes_number'
      assert_select 'input#user_address_attributes_zip_code'
    end
  end

  test 'POST new_with_address creates a user with nested address attributes' do
    assert_equal 0, User.count
    assert_equal 0, Address.count

    user_params = {
      user: {
        name: 'John',
        lastname: 'Doe',
        email: 'email@test.com',
        address_attributes: {
          street: 'Fake Street',
          number: '123',
          zip_code: '0'
        }
      }
    }

    post new_with_address_users_path, params: user_params

    assert_equal 1, User.count
    assert_equal 1, Address.count

    assert_redirected_to action: :show, id: User.first.id

    u = User.first
    a = u.address

    assert_equal 'John', u.name
    assert_equal 'Doe', u.lastname
    assert_equal 'email@test.com', u.email
    assert_equal 'Fake Street', a.street
    assert_equal '0', a.zip_code
    assert_equal '123', a.number
  end

  test 'GET edit_with_address shows a form for the user with nested address attributes' do
    user = User.create! name: 'John', lastname: 'Doe', email: 'email@test.com',
                        address_attributes: { street: 'Fake street', number: '123', zip_code: '3434' }

    get edit_with_address_user_path(user)
    assert_response :success
    assert_select 'form.user_form_with_address' do
      assert_select 'input#user_address_attributes_street'
      assert_select 'input#user_address_attributes_number'
      assert_select 'input#user_address_attributes_zip_code'
    end
  end

  test 'PATCH edit_with_address updates a user with nested address attributes' do
    user = User.create! name: 'John', lastname: 'Doe', email: 'email@test.com',
                        address_attributes: { street: 'Fake street', number: '123', zip_code: '3434' }

    user_params = {
      user: {
        name: 'Jane',
        lastname: 'Doe',
        email: 'email2@test.com',
        address_attributes: {
          street: 'Fake Street2',
          number: '111',
          zip_code: '1'
        }
      }
    }

    patch edit_with_address_user_path(user), params: user_params
    assert_redirected_to action: :show

    u = User.first
    a = u.address

    assert_equal 'Jane', u.name
    assert_equal 'Doe', u.lastname
    assert_equal 'email2@test.com', u.email
    assert_equal 'Fake Street2', a.street
    assert_equal '1', a.zip_code
    assert_equal '111', a.number
  end

  test 'GET show shows all the user data' do
    user = User.create! name: 'John', lastname: 'Doe', email: 'email@test.com',
                        address_attributes: { street: 'Fake street', number: '123', zip_code: '3434' }

    get user_path(user)

    assert_response :success

    assert_select 'span', 'email@test.com'
    assert_select 'span', 'Fake street 123 3434'
  end
end
