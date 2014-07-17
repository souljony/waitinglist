class Listum < ActiveRecord::Base
	belongs_to :dium
	has_one :cliente
	validates :nome, presence: true
	validates :pax, numericality: { only_integer: true }, presence: true
end