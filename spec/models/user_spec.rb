require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }
    
    let(:user) { build(:user, is_user: true) }
    
    context 'nick_nameカラム'do
      it '空欄チェック' do
        user.nick_name = ' '
        is_expected.to eq false
      end
    end
      
    
  end
end



