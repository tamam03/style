require 'rails_helper'

RSpec.describe "Brandモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { brand.valid? }

    let(:brand) { build(:brand) }

    it '空欄でないこと' do
      brand.brand_name = ''
      is_expected.to eq false
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Storeモデルとの関係' do
      it 'N:1になっている' do
        expect(Brand.reflect_on_association(:stores).macro).to eq :has_many
      end
    end

    context 'Userモデルとの関係' do
      it '1:Nになっている' do
        expect(Brand.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    
    context 'Itemモデルとの関係' do
      it '1:Nになっている' do
        expect(Brand.reflect_on_association(:items).macro).to eq :has_many
      end
    end
  end
end
