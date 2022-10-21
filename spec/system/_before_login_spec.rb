require 'rails_helper'

describe "ログイン前テスト" do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
  
    context '表示内容の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq '/'
      end
      
      it 'トップ画面にLog inボタンがあるか' do
        expect(page).to have_link "Log in", href: new_user_session_path
      end
      
      it 'トップ画面にSign upボタンがあるか' do
        expect(page).to have_link "Sign up", href: new_user_registration_path
      end
      
      it 'トップ画面にguestボタンがあるか' do
        expect(page).to have_link "Guest", href: public_guests_path
      end
    end
  end
end
  