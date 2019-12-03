# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    load_user
  end

  # actions to edit the user alone

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to @user
    else
      render action: :new
    end
  end

  def edit
    load_user
  end

  def update
    load_user
    @user.attributes = user_params

    if @user.save
      redirect_to @user
    else
      render action: :edit
    end
  end

  # actions to edit the user with the address

  def new_with_address
    @user = User.new

    # build the address so we can use the same form code for both
    # create and update actions
    @user.build_address
  end

  def edit_with_address
    load_user

    # build the address if it's not present
    @user.build_address if @user.address.blank?
  end

  def create_with_address
    @user = User.new user_with_address_params

    if @user.save
      redirect_to @user
    else
      render action: :new_with_address
    end
  end

  def update_with_address
    load_user
    @user.attributes = user_with_address_params

    if @user.save
      redirect_to @user
    else
      render action: :edit_with_address
    end
  end

  # actions to edit the user with a fixed amount of pets

  def new_with_pets
    @user = User.new

    # this example shows a form with a fixed amount of pets
    3.times { @user.pets.build }
  end

  def edit_with_pets
    load_user

    # make sure we have 3 pets to edit
    (3 - @user.pets.size).times { @user.pets.build }
  end

  def create_with_pets
    @user = User.new user_with_pets_params

    if @user.save
      redirect_to @user
    else
      (3 - @user.pets.size).times { @user.pets.build }
      render action: :new_with_pets
    end
  end

  def update_with_pets
    load_user
    @user.attributes = user_with_pets_params

    if @user.save
      redirect_to @user
    else
      (3 - @user.pets.size).times { @user.pets.build }
      render action: :edit_with_pets
    end
  end

  # actions to edit the user with a variable amount of pets (add/destroy actions)

  def new_with_variable_pets
    @user = User.new

    # build two pets just to show something, it's not really needed
    2.times { @user.pets.build }
  end

  def edit_with_variable_pets
    load_user
  end

  def create_with_variable_pets
    @user = User.new user_with_pets_params

    if params[:commit] == 'add_pet'
      @user.pets.build
      render action: :new_with_variable_pets
    else
      if @user.save
        redirect_to @user
      else
        render action: :new_with_variable_pets
      end
    end
  end

  def update_with_variable_pets
    load_user
    @user.attributes = user_with_pets_params

    if params[:commit] == 'add_pet'
      @user.pets.build
      render action: :edit_with_variable_pets
    else
      if @user.save
        redirect_to @user
      else
        render action: :edit_with_variable_pets
      end
    end
  end

  # actions to edit the user with the address and variable amount of pets!

  def new_with_address_and_pets
    @user = User.new

    @user.build_address

    # build two pets just to show something, it's not really needed
    2.times { @user.pets.build }
  end

  def edit_with_address_and_pets
    load_user

    @user.build_address if @user.address.blank?
  end

  def create_with_address_and_pets
    @user = User.new user_with_address_and_pets_params

    if params[:commit] == 'add_pet'
      @user.pets.build
      render action: :new_with_address_and_pets
    else
      if @user.save
        redirect_to @user
      else
        render action: :new_with_address_and_pets
      end
    end
  end

  def update_with_address_and_pets
    load_user
    @user.attributes = user_with_address_and_pets_params

    if params[:commit] == 'add_pet'
      @user.pets.build
      render action: :edit_with_address_and_pets
    else
      if @user.save
        redirect_to @user
      else
        render action: :edit_with_address_and_pets
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email)
  end

  def user_with_address_params
    params.require(:user)
          .permit(:name, :lastname, :email,
                  address_attributes: %i[street number zip_code])
  end

  def user_with_pets_params
    params.require(:user)
          .permit(:name, :lastname, :email,
                  pets_attributes: %i[id name species _destroy])
  end

  def user_with_address_and_pets_params
    params.require(:user)
          .permit(:name, :lastname, :email,
                  address_attributes: %i[street number zip_code],
                  pets_attributes: %i[id name species _destroy])
  end

  def load_user
    @user ||= User.find(params[:id])
  end
end
