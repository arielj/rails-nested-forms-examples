# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  # using update_only: true, we want to edit the current user, don't replace it
  accepts_nested_attributes_for :user, update_only: true

  validates :street, :number, :zip_code, presence: true

  def to_label
    [street, number, zip_code].compact.join(' ')
  end
end
