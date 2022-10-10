require 'rails_helper'

RSpec.describe "Brandモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it '有効な内容の場合保存できるか' do
      expect (FactoryBot.build(:brand)).to be_valid
    end
  end
    
  context "バリデーションのテスト" do
    it '空欄でないこと' do
      brand.brand_name = ''
      is_expected.to eq false
    end
  end
end