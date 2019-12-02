# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
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
    @user = User.create user_with_address_params

    if @user.persisted?
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

  def show
    load_user
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

  def load_user
    @user ||= User.find(params[:id])
  end
end
