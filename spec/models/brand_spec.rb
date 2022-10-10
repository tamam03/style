require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    it '空欄でないこと' do
      brand.brand_name = ''
      is_expected.to eq false
    end
  end
end