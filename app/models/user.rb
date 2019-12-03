# frozen_string_literal: true

class User < ApplicationRecord
  has_one :address

  # using update_only: true, we want to edit the current address, don't replace it
  accepts_nested_attributes_for :address, update_only: true

  has_many :pets
  accepts_nested_attributes_for :pets, allow_destroy: true, reject_if: :all_blank

  validates :name, :lastname, :email, presence: true

  def to_label
    "#{lastname}, #{name} (#{email}) (ID: #{id})"
  end
end
