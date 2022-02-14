class Player < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :played_games, through: :participations, source: 'game'

  validates_presence_of :name, :age, :contact_number, :email
  validates_uniqueness_of :name, :contact_number, :email
end
