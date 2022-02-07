class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end

  validates :category_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_charge_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
end
