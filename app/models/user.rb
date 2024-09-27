class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true

  # パスワードのバリデーション設定
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'には英字と数字の両方を含めてください' }

  # 名前の漢字バリデーション設定
  validates :first_name, :last_name,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }

  # 名前カナバリデーション設定
  validates :first_name_kana, :last_name_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: 'カナ文字を使用してください' }
end
