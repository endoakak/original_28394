require 'rails_helper'

RSpec.describe "Reactions", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  context "リアクションができるとき" do
    it "ログインしているユーザーはリアクションでき、取り消すこともできる" do
      # ログインする
      sign_in(@post.user)
      # 投稿詳細ページへ移動
      visit post_path(@post)
      # リアクションボタンが表示されている
      expect(page).to have_selector "#reaction-btn-1"
      # ボタンの隣に0が表示されている
      expect(page).to have_selector "#reaction-count-1", text: "0"
      # リアクションボタンを押す
      click_on("その気持ち、わかります！")
      # 初めのボタンが表示されていない
      expect(page).to have_no_selector "#reaction-btn-1"
      # checkedのボタンが表示されている
      expect(page).to have_selector "#reaction-btn-1-checked"
      # ボタンの隣に1が表示されている
      expect(page).to have_selector "#reaction-count-1", text: "1"
      # checkedのボタンを押す
      click_on("その気持ち、わかります！")
      # checkedのボタンが表示されていない
      expect(page).to have_no_selector "#reaction-btn-1-checked"
      # 初めのボタンが表示されている
      expect(page).to have_selector "#reaction-btn-1"
      # ボタンの隣に0が表示されている
      expect(page).to have_selector "#reaction-count-1", text: "0"
    end
  end

  context "リアクションができないとき" do
    it "ログインしていないユーザーはリアクションボタンを押せない" do
      # 投稿詳細ページへ移動
      visit post_path(@post)
      # クリックできないリアクションボタンが表示されている
      expect(page).to have_selector ".comment", text: "その気持ち、わかります！"
      # その隣に0が表示されている
      expect(page).to have_selector "#reaction-count-1", text: "0"
    end
  end
end
