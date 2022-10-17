require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    
    let!(:other_user) { create(:user, nick_name: 'aaa', is_user: true) }
    let(:user) { FactoryBot.build(:user, nick_name: 'aaa', is_user: true) }
      subject { user.valid? }
    
    context 'nick_nameカラム'do
      let(:test_user) { user }
      it '空欄チェック' do
        user.nick_name = ''
        is_expected.to eq false
      end
    end
  end
end



