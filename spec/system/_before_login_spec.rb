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
      
      it 'トップ画面にログインボタンがあるか' do
        expect(page).to have_link"", href: new_user_session_path
      end
    end
  end
end
  