# require 'rails_helper'

# RSpec.describe 'トップページ', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#   end

#   context 'ログアウト状態の場合' do
#     it 'トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示されること' do
#       visit root_path  # トップページにアクセスする
#       # ヘッダーに「新規登録」と「ログイン」ボタンが表示されているか確認
#       expect(page).to have_content('新規登録')
#       expect(page).to have_content('ログイン')
#     end
#     it 'トップページ（商品一覧ページ）ヘッダーの、「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できること' do
#       # トップページにアクセスする
#       visit root_path 
#       # 「新規登録」ボタンをクリックし、新規登録ページに遷移できることを確認
#       click_link '新規登録'
#       expect(current_path).to eq new_user_registration_path
#       # トップページに戻る
#       visit root_path
#       # 「ログイン」ボタンをクリックし、ログインページに遷移できることを確認
#       click_link 'ログイン'
#       expect(current_path).to eq new_user_session_path
#     end
#   end

#   context 'ログイン状態の場合' do
#     # ログインする
#     before do
#       sign_in(@user) 
#     end
#     it 'トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示されること' do
#       visit root_path
#       expect(page).to have_content(@user.nickname)
#       expect(page).to have_content('ログアウト')
#     end
#     it 'トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができること' do
#       visit root_path
#       click_link 'ログアウト'
#       expect(current_path).to eq destroy_user_session_path
#       expect(page).to have_content('新規登録')
#       expect(page).to have_content('ログイン')
#     end
#   end
# end