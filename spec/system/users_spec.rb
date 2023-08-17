require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示されること' do
    visit root_path
    expect(page).to have_content('新規登録')
    expect(page).to have_content('ログイン')
  end
  
  it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示されること' do
    visit new_user_registration_path
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
    expect(page).to have_content(@user.nickname)
    expect(page).to have_content('ログアウト')
  end

  it 'トップページ（商品一覧ページ）ヘッダーの、「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できること。' do
    visit root_path
    click_link '新規登録'
    expect(page).to have_current_path(new_user_registration_path)
    visit root_path
    click_link 'ログイン'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができること。' do
    visit new_user_registration_path
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
    click_link 'ログアウト'
    expect(page).to have_content('ログイン')
  end
end
