require 'rails_helper'

describe 'ユーザーログイン後のテスト' do

let(:user) { create(:user, nick_name: 'aaa', is_user: true) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
  
  describe 'ログイン時ヘッダーのテスト' do
    subject { current_path }
    
    context 'アイコン表示確認' do
      it '検索ページアイコン：虫眼鏡' do
        expect(page).to have_selector('.fas.fa-search')
      end
      it '新規投稿アイコン: +' do
        expect(page).to have_selector('.far.fa-plus-square')
      end
      it '通知ページアイコン：ベル' do
        expect(page).to have_selector('.fas.fa-bell')
      end
      it 'マイページアイコン：人' do
        expect(page).to have_selector('.fas.fa-user')
      end
      it 'ログアウトアイコン：矢印' do
        expect(page).to have_selector('.fas.fa-sign-out-alt')
      end
    end
  end
end