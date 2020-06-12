class Player < ApplicationRecord
	belongs_to :team
	validates :name, :presence => true
	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :phash, :presence => true
	validates :team, :presence => true
end
