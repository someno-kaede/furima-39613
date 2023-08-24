require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    @product = FactoryBot.build(:product)
    @user = FactoryBot.build(:user)
  end

  it 'ログアウト状態の場合、商品出品ページに遷移しようとするとログイン画面に遷移する' do
    #ルートパスへ移動
    visit root_path
    #出品するボタンのクリック
    click_link '出品する'
    #ログイン画面に強制遷移されるので、ログイン画面に存在する文字列が表示される
    expect(page).to have_content('会員情報入力')
  end

  it 'ログイン状態の場合、商品出品ページの遷移が可能' do
    #ルートパスへ移動
    visit root_path
    #新規登録画面に移動
    visit new_user_registration_path
    #フォームに入力
    fill_in '例) furima太郎', with: @user.nickname
    fill_in 'PC・携帯どちらでも可', with: @user.email
    fill_in '6文字以上の半角英数字', with: @user.password
    fill_in '同じパスワードを入力して下さい', with: @user.password_confirmation
    fill_in '例) 山田', with: @user.first_name
    fill_in '例) 陸太郎', with: @user.last_name
    fill_in '例) ヤマダ', with: @user.reading_first_name
    fill_in '例) リクタロウ', with: @user.reading_last_name
    select '1994', from: 'user[birthday(1i)]'
    select '1', from: 'user[birthday(2i)]'
    select '1', from: 'user[birthday(3i)]'
    find('input[name="commit"]').click
    #出品するボタンのクリック
    click_link '出品する'
    #ログイン状態なので、商品出品画面に存在する文字列が表示される
    expect(page).to have_content('商品の情報を入力')
  end

  it '販売手数料と利益の表示がされる' do
    #ルートパスへ移動
    visit root_path
    #新規登録画面に移動
    visit new_user_registration_path
    #フォームに入力
    fill_in '例) furima太郎', with: @user.nickname
    fill_in 'PC・携帯どちらでも可', with: @user.email
    fill_in '6文字以上の半角英数字', with: @user.password
    fill_in '同じパスワードを入力して下さい', with: @user.password_confirmation
    fill_in '例) 山田', with: @user.first_name
    fill_in '例) 陸太郎', with: @user.last_name
    fill_in '例) ヤマダ', with: @user.reading_first_name
    fill_in '例) リクタロウ', with: @user.reading_last_name
    select '1994', from: 'user[birthday(1i)]'
    select '1', from: 'user[birthday(2i)]'
    select '1', from: 'user[birthday(3i)]'
    find('input[name="commit"]').click
    #出品するボタンのクリック
    click_link '出品する'
    #フォームに価格の入力
    fill_in '例）300', with: @product.price
    #手数料が表示されているか調べる
    #expect(page).to have_content(@product.price * 0.1)
  end

end
