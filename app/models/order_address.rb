class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :cell_hone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :city
    validates :house_number
    validates :cell_hone_number,  format: {  with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }, length: { minimum: 11, message: 'is too short' }
    validates :postal_code,       format: {  with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, cell_hone_number: cell_hone_number, order_id: order.id)
  end

end