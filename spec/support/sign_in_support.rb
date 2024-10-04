module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Nickname', with: @user.nickname
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password_confirmation', with: @user.password
    fill_in 'First_name', with: @user.first_name
    fill_in 'Last_name', with: @user.last_name
    fill_in 'First_name_kana', with: @user.first_name_kana
    fill_in 'Last_name_kana', with: @user.last_name_kana
    fill_in 'Birthday', with: @user.birthday
    find('input[name="会員登録"]').click
    expect(page).to have_current_path(root_path)
  end
end
