class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  FULL_WIDTH_KANA_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :name, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birthday, presence: true
  validates :family_name, :first_name, format: { with: FULL_WIDTH_REGEX, message: "は全角で入力して下さい" }
  validates :family_name_furigana, :first_name_furigana, format: { with: FULL_WIDTH_KANA_REGEX, message: "はカタカナ（全角）で入力して下さい" }
  validates :name, presence: true
end
