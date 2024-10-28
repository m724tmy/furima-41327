require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_form = FactoryBot.build(:buy_form, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it '全ての必須項目が正しく入力されていれば保存できる' do
        expect(@buy_form).to be_valid
      end
    end

    context '配送先情報が保存できない場合' do
      it '郵便番号が空では保存できない' do
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」でない場合保存できない' do
        @buy_form.post_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が未選択の場合保存できない' do
        @buy_form.prefecture_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空では保存できない' do
        @buy_form.municipality = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では保存できない' do
        @buy_form.street_address = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @buy_form.phone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では保存できない' do
        @buy_form.phone_number = '090123456'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid. Input only numbers.")
      end
      it '電話番号が12桁以上だと購入できない' do
        @buy_form.phone_number = '090123456789'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid. Input only numbers.")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @buy_form.phone_number = '０9012341234'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid. Input only numbers.")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @buy_form.user_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐づいていなければ購入できないこと' do
        @buy_form.item_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end