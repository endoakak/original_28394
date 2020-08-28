require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "新規投稿ができるとき" do
    it "ログインしたユーザーは新規投稿ができる" do
      # ログインする
      sign_in(@user)
      # 投稿一覧ページへ移動
      visit posts_path
      # 新規投稿へのリンクがある
      expect(page).to have_link "新規投稿", href: new_post_path
      # 新規投稿ページへ移動
      visit new_post_path
      # フォームを入力
      fill_in "post_title", with: "タイトルサンプル"
      select "小説", from: "カテゴリー"
      choose "ネタバレなし"
      fill_in "post_content", with: "本文サンプル"
      # 投稿ボタンをクリックしてPostモデルのカウントが1増える
      expect  do
        click_button("投稿する！")
      end.to change { Post.count }.by(1)
      # 投稿一覧ページへ遷移する
      expect(current_path).to eq posts_path
      # 投稿が表示されている
      expect(page).to have_content("タイトルサンプル")
      expect(page).to have_content("本文サンプル")
    end
  end

  context "新規投稿ができないとき" do
    it "ログインしていないと新規投稿ページへ移動できない" do
      # 投稿一覧ページへ移動
      visit new_post_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_link "新規投稿", href: new_post_path
    end
  end
end

RSpec.describe "投稿の編集", type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context "投稿の編集ができるとき" do
    it "投稿したユーザーは投稿の編集ができる" do
      # @post1のユーザーでログイン
      sign_in(@post1.user)
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に編集ページへのリンクが表示されている
      expect(
        all(".post-wrapper")[1]
      ).to have_link "編集する", href: edit_post_path(@post1)
      # post1の編集ページへ移動
      visit edit_post_path(@post1)
      # 投稿済みの内容がフォームに入っている
      expect(page).to have_field "タイトル", with: @post1.title
      expect(page).to have_select("カテゴリー", selected: @post1.category.name)
      expect(page).to have_checked_field("ネタバレあり")
      expect(page).to have_field "本文", with: @post1.content
      # 投稿内容の編集
      fill_in "post_title", with: "タイトルサンプル"
      select "小説", from: "カテゴリー"
      choose "ネタバレなし"
      fill_in "post_content", with: "本文サンプル"
      # 更新ボタンを押してPostモデルのカウントが変わらない
      expect  do
        click_button("編集を保存する！")
      end.to change { Post.count }.by(0)
      # 投稿一覧へ遷移する
      expect(current_path).to eq posts_path
      # 編集した投稿が表示されている
      expect(page).to have_content("タイトルサンプル")
      expect(page).to have_content("本文サンプル")
    end
  end

  context "投稿の編集ができないとき" do
    it "投稿したユーザーでなければ投稿編集ページへ移動できない" do
      # @post2のユーザーでログイン
      sign_in(@post2.user)
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に編集ページへのリンクが表示されていない
      expect(
        all(".post-wrapper")[1]
      ).to have_no_link "編集する", href: edit_post_path(@post1)
    end

    it "ログインしていないと投稿編集ページへ移動できない" do
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に編集ページへのリンクが表示されていない
      expect(
        all(".post-wrapper")[1]
      ).to have_no_link "編集する", href: edit_post_path(@post1)
    end
  end
end

RSpec.describe "Posts", type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context "投稿の削除ができるとき" do
    it "投稿したユーザーは投稿の削除ができる" do
      # @post1のユーザーでログイン
      sign_in(@post1.user)
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に削除ボタンが表示されている
      expect(
        all(".post-wrapper")[1]
      ).to have_link "削除する", href: post_path(@post1)
      # 削除ボタンを押すとPostモデルのカウントが１減る
      expect do
        click_on("削除する")
      end.to change { Post.count }.by(-1)
      # 投稿一覧ページへ遷移
      expect(current_path).to eq posts_path
      # post1が存在しない
      expect(page).to have_no_content(@post1.title)
    end
  end

  context "投稿の削除ができないとき" do
    it "投稿したユーザーでなければ投稿の削除ができない" do
      # @post2のユーザーでログイン
      sign_in(@post2.user)
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に削除ボタンが表示されていない
      expect(
        all(".post-wrapper")[1]
      ).to have_no_link "削除する", href: post_path(@post1)
    end

    it "ログインしていないと投稿の削除ができない" do
      # 投稿一覧ページへ移動
      visit posts_path
      # post1に編集ページへのリンクが表示されていない
      expect(
        all(".post-wrapper")[1]
      ).to have_no_link "削除する", href: post_path(@post1)
    end
  end
end

RSpec.describe "ネタバレ非表示", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  it "チェックを入れるとネタバレありの投稿を非表示にできる" do
    # 投稿一覧ページへ移動
    visit posts_path
    # ネタバレありの投稿が表示されている
    expect(page).to have_selector ".post-wrapper", text: "ネタバレあり"
    # ネタバレ非表示にチェックを入れる
    check "spoiler-check-box"
    # ネタバレありの投稿が表示されていない
    expect(page).to have_no_selector ".post-wrapper", text: "ネタバレあり"
  end
end
