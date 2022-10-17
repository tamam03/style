require 'rails_helper'

RSpec.describe "Itemモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:true_user) { build(:user, nick_name: 'aaa', is_user: true) }
    let!(:item) { build(:item, user_id: true_user.id) }

    context 'textカラム' do
      it '200字以内であること' do
        item.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Brandモデルとの関係' do
      it 'N:1になっている' do
        expect(Item.reflect_on_association(:brand).macro).to eq :belongs_to
      end
    end
    
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Item.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
