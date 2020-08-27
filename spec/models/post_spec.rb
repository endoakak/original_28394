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
      expect(@post.errors.full_messages).to include("作品のタイトルを入力してください")
    end

    it "contentが空だと保存できない" do
      @post.content = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("投稿の内容を入力してください")
    end

    it "contentが4000文字を超えていると保存できない" do
      @post.content = Faker::Lorem.characters(number: 4001)
      @post.valid?
      expect(@post.errors.full_messages).to include("投稿の内容は4000文字以内で入力してください")
    end

    it "spoiler情報がないと保存できない" do
      @post.spoiler = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("ネタバレは一覧にありません")
    end

    it "categoryが空だと保存できない" do
      @post.category = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("カテゴリーを入力してください")
    end
  end
end
