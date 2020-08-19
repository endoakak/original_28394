require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "情報が揃っていれば保存できる" do
      expect(@user).to be_valid
    end

    it "nameが空だと保存できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "passwordが5文字以下だと保存できない" do
      password = "pass1"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は6文字以上12文字以下で英数字混合で入力してください")
    end

    it "passwordが13文字以上だと保存できない" do
      password = "password12345"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は6文字以上12文字以下で英数字混合で入力してください")
    end

    it "passwordが英数字混合でなければ保存できない" do
      password = "password"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は6文字以上12文字以下で英数字混合で入力してください")
    end
  end
end