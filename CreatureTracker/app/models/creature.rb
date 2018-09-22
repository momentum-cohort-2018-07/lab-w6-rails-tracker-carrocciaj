class Creature < ApplicationRecord
  has_many :notes, dependent: :destroy
end
