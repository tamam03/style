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
    end
  end
end
  