require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録ができるとき" do
    it "正しい情報を入力すればユーザー新規登録ができてトップページに移動する" do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_link "新規登録", href: new_user_registration_path
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "user_name", with: @user.name
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      fill_in "user_password_confirmation", with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        click_on("登録する")
      end.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_link "ログアウト", href: destroy_user_session_path
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_link "新規登録", href: new_user_registration_path
      expect(page).to have_no_link "ログイン", href: new_user_session_path
    end
  end

  context "ユーザー新規登録ができないとき" do
    it "誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる" do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_link "新規登録", href: new_user_registration_path
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "user_name", with: ""
      fill_in "user_email", with: ""
      fill_in "user_password", with: ""
      fill_in "user_password_confirmation", with: ""
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect  do
        click_on("登録する")
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context "ログインができるとき" do
    it "正しい情報を入力すればログインができてトップページに移動する" do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link "ログイン", href: new_user_session_path
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      # ログインボタンを押す
      click_button("ログイン")
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_link "ログアウト", href: destroy_user_session_path
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_link "新規登録", href: new_user_registration_path
      expect(page).to have_no_link "ログイン", href: new_user_session_path
    end
  end

  context "ログインができないとき" do
    it "誤った情報ではログインができずにログインページへ戻ってくる" do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link "ログイン", href: new_user_session_path
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in "user_email", with: ""
      fill_in "user_password", with: ""
      # ログインボタンを押す
      click_button("ログイン")
      # ログインページへ戻されることを確認する
      expect(current_path).to eq "/users/sign_in"
    end
  end
end
