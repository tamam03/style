require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { true_user.valid? }

    let(:true_user) { build(:user, nick_name: 'aaa', is_user: true) }
    
    context 'nick_nameカラム'do
      it '空欄チェック' do
        true_user.nick_name = ''
        is_expected.to eq false
      end
    end
  end
end



