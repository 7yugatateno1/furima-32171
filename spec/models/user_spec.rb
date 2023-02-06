require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "メールアドレスが空だと登録できない" do
    end
    it "メールアドレスは@を含まないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードは6文字以上でないと登録できない" do
    end
    it "パスワードとパスワード（確認）の値が一致しないと登録できない" do
    end
    it "苗字(全角)が空だと登録できない" do
    end
    it "名前(全角)が空だと登録できない" do
    end
    it "苗字フリガナ(全角）が空だと登録できない" do
    end
    it "苗字のフリガナが全角でないと登録できない" do
    end
    it "名前フリガナ(全角)が空だと登録できない" do
    end
    it "名前のフリガナが全角でないと登録できない" do
    end
    it "誕生日が空だと登録できない" do
    end
  end
end