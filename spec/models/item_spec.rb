require 'rails_helper'

RSpec.describe "Itemモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:user) { create(:user) }
    let!(:item) { build(:item, user_id: user.id) }

    context 'textカラム' do
      it '200字以下であること' do
        item.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
end
