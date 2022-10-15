require 'rails_helper'

RSpec.describe "Itemモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.create(:user) }
    let!(:item) { build(:item, user_id: user.id) }
    
    subject { test_item.valid? }
    let(:test_item) { item }
  end
end




# text字数
