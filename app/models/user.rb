# frozen_string_literal: true

class User < ApplicationRecord
  has_one :address

  # using update_only: true, we want to edit the current address, don't replace it
  accepts_nested_attributes_for :address, update_only: true

  has_many :pets
  accepts_nested_attributes_for :pets, allow_destroy: true, reject_if: :all_blank, limit: 10

  validates :name, :lastname, :email, presence: true

  def to_label
    "#{lastname}, #{name} (#{email}) (ID: #{id})"
  end

  # if limit option is present and the user has >= pets than that, returns false
  # else, builds a new pet
  def build_pet_with_limit
    return false if pets_limit_reached?

    pets.build
  end

  def pets_limit_reached?
    lmt = self.class.nested_attributes_options[:pets][:limit]
    lmt.present? && pets.size >= lmt
  end
end
