# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, update_only: true

  validates :name, :species, presence: true

  def to_label
    "#{name} (#{species})"
  end
end
