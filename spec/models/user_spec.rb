require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context '新規登録できない場合' do

      it "nicknameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

     it "メールアドレスが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
     end

      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "苗字(全角)が空だと登録できない" do
        @user.family_name = ''
        @user.valid?
      end

      it "名前(全角)が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
      end

      it "苗字フリガナ(全角）が空だと登録できない" do
        @user.family_name_furigana = ''
        @user.valid?
      end

      it "名前フリガナ(全角)が空だと登録できない" do
        @user.first_name_furigana = ''
        @user.valid?
      end

      it "誕生日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
      end
    end
  end
end