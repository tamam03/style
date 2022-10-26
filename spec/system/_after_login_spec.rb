require 'rails_helper'

describe 'ユーザーログイン後のテスト' do

let(:user) { create(:user, nick_name: 'aaa', is_user: true) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
  
end