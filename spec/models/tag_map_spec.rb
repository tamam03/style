require 'rails_helper'

RSpec.describe "TagMapモデルのテスト", type: :model do
  describe 'アソシエーションのテスト' do
    context 'Itemモデルとの関係' do
      it 'N:1になっている' do
        expect(TagMap.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end
    context 'ItemTagモデルとの関係' do
      it 'N:1になっている' do
        expect(TagMap.reflect_on_association(:item_tag).macro).to eq :belongs_to
      end
    end
  end
end