require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#create" do
    before do
      @post = FactoryBot.build(:post)
    end

    it "情報が揃っていれば保存できる" do
      expect(@post).to be_valid
    end

    it "titleが空だと保存できない" do
      @post.title = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end

    it "contentが空だと保存できない" do
      @post.content = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Content can't be blank")
    end

    it "contentが1000文字を超えていると保存できない" do
      @post.content = Faker::Lorem.characters(number: 1001)
      @post.valid?
      expect(@post.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")
    end

    it "spoiler情報がないと保存できない" do
      @post.spoiler = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Spoiler is not included in the list")
    end

    it "categoryが空だと保存できない" do
      @post.category = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Category can't be blank")
    end
  end
end
