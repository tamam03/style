require 'rails_helper'

RSpec.describe "Commentモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }
    
    let(:brand) { build(:brand) }
    let(:store) { build(:store) }
    let(:false_user) { build(:user, is_user: false, brand_id: brand.id, store_id: store.id) }
    let(:item) { build(:item, user_id: false_user.id) }
    let!(:comment) { build(:comment, user_id: false_user.id, item_id: item.id) }
    
    context 'textカラム' do
      it '空欄でないこと' do
        comment.text = ''
        is_expected.to eq false
      end
      
      it '200字以内であること' do
        comment.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    
    context 'Itemモデルとの関係' do
      it 'N:1になっている' do
        expect(Comment.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end
  end
end