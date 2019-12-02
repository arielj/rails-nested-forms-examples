# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new_with_user
    @address = Address.new
    @address.build_user
  end

  def edit_with_user
    load_address
    @address.build_user if @address.user.blank?
  end

  def create_with_user
    @address = Address.create address_with_user_params

    if @address.persisted?
      redirect_to @address
    else
      render action: :new_with_user
    end
  end

  def update_with_user
    load_address
    @address.attributes = address_with_user_params

    if @address.save
      redirect_to @user
    else
      render action: :edit_with_user
    end
  end

  def show
    load_address
  end

  private

  def address_with_user_params
    params.require(:address)
          .permit(:street, :number, :zip_code,
                  user_attributes: %i[name lastname email])
  end

  def load_address
    @address ||= Address.find(params[:id])
  end
end
