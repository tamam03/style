require 'rails_helper'

RSpec.describe "Itemモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:true_user) { build(:user, nick_name: 'aaa', is_user: true) }
    let!(:item) { build(:item, user_id: true_user.id) }
    
    # it 'test' do
    #   binding.pry
    # end

    context 'textカラム' do
      it '200字以下であること' do
        item.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
end
