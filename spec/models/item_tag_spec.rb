require 'rails_helper'

RSpec.describe "ItemTagモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject{ item_tag.valid? }

    let(:item_tag) { create(:item_tag) }
   
    context 'tag_nameカラム' do
      it '空欄でないこと' do
        item_tag.tag_name = ''
        is_expected.to eq false
      end
    end
  end
end
