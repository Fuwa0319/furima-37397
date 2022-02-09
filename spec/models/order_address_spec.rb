require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '配送先情報に問題ない場合' do
      it '配送先項目に必要な情報が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it 'builing_nameは空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '配送先情報に問題ある場合' do
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは３桁-4桁のフォーマットでなくては登録できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
        
      end

      it 'postal_codeの３桁と４桁は半角数字でなければ登録できない' do
        @order_address.postal_code = 'aaa-bbbb'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecture_idが空(id=0)では登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'cell_phone_numberが空では登録できない' do
        @order_address.cell_phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cell phone number can't be blank")
      end

      it 'cell_phone_numberは半角数字以外では登録できない' do
        @order_address.cell_phone_number = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cell phone number is invalid. Input only number")
      end

      it 'cell_phone_numberは11桁でなければ登録できない' do
        @order_address.cell_phone_number = '0901234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cell phone number is too short")
      end

    end

  end
end
