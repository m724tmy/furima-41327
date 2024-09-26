require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # Userのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '会員情報入力欄全てが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'nicknameが7文字以上では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが129文字以上では登録できない' do
      end
      it 'passwordを英数字含まないと登録できない' do
      end
      it 'last_nameは全角文字以外は登録できない' do
      end
      it 'first_nameは全角文字以外は登録できない' do
      end
      it 'last_name_kanaは全角カタカナ文字以外登録できない' do
      end
      it 'first_name_kanaは全角カタカナ文字以外登録できない' do
      end
      end
    end
  end
end
