require 'rails_helper'

RSpec.describe "Itemモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    let(:item) { FactoryBot.build(:item) }
    subject { item.valid? }

    let(:user) { create(:user, nick_name: 'aaa', is_user: true) }
    let!(:item) { build(:item, user_id: user.id) }
    
    # it 'test' do
    #   binding.pry
    # end

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
