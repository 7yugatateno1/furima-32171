class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  FULL_WIDTH_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :name, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birthday, presence: true
  validates :family_name, :first_name, format: { with: FULL_WIDTH_REGEX, message: "は全角で入力して下さい" }
  validates :family_name_furigana, :first_name_furigana, format: { with: FULL_WIDTH_KANA_REGEX, message: "はカタカナ（全角）で入力して下さい" }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英字と半角数字の両方を含めて設定してください" }
  
  has_many :items
  #has_many :buy_records
end
