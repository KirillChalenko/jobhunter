class Item < ActiveRecord::Base
	attr_accessible :name, :price, :description, :weight, :real

	validates :price, numericality: { greater_than: 0, allow_nil: true}
	validates :name, presence: true

	has_and_belongs_to_many :carts

end
