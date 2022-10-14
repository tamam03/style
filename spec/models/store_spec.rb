require 'rails_helper'

RSpec.describe "Storeモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { store.valid? }
    
    let(:store) { build(:store) }
    
    it '空欄でないこと' do
      store.store_name = ''
      is_expected.to eq false
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nになっている' do
        expect(Store.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    
    context 'Brandモデルとの関係' do
      it 'N:1になっている' do
        expect(Store.reflect_on_association(:brand).macro).to eq :belongs_to
      end
    end
  end
end