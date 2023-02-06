require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context '新規登録できる場合' do

      it "全ての項目の入力が存在すれば登録できる" do
        @user = FactoryBot.build(:user)
      end
    
    end 

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

     it '重複したemailが存在する場合は登録できない' do
        @user.email
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end    

      it "姓(全角)が空だと登録できない" do
        @user.family_name = ''
        @user.valid?
      end

      it '姓が全角でなければ登録できない' do
        @user.family_name = "ｱｲｳｴｵ"
        @user.valid?
      end

      it "名(全角)が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
      end

      it '名が全角でなければ登録できない' do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
      end

      it "姓のフリガナ(全角）が空だと登録できない" do
        @user.family_name_furigana = ''
        @user.valid?
      end

      it '姓のフリガナが全角カタカナでなければ登録できない' do
        @user.family_name_furigana = "あいうえお"
        @user.valid?
      end

      it "名のフリガナ(全角)が空だと登録できない" do
        @user.first_name_furigana = ''
        @user.valid?
      end

      it '名のフリガナが全角カタカナでなければ登録できない' do
        @user.first_name_furigana = "あいうえお"
        @user.valid?
      end

      it "誕生日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
      end
    end
  end
end