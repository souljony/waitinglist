class Cliente < ActiveRecord::Base
	has_many :listums, dependent: :destroy
	validates :nome, presence: true
end
