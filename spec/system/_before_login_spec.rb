require 'rails_helper'

describe "ログイン前テスト" do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq '/'
      end
      it 'トップ画面にLog inボタンがあるか' do
        expect(page).to have_link "Log in", href: new_user_session_path
      end
      it 'トップ画面にSign upボタンがあるか' do
        expect(page).to have_link "Sign up", href: new_user_registration_path
      end
      it 'トップ画面にguestボタンがあるか' do
        expect(page).to have_link "Guest", href: public_guests_path
      end
    end

    context 'ヘッダーのテスト:ログインをしていない場合' do
      it 'styleリンクが表示される' do
        expect(page).to have_link "style", href: root_path
      end
      it 'aboutリンクが表示される' do
        expect(page).to have_link "About", href: homes_about_path
      end
      it 'guideリンクが表示される' do
        expect(page).to have_link "Guide", href: homes_guide_path
      end
    end

    context 'リンクの内容確認' do
      subject { current_path }

      it 'styleをおすとルートページへ遷移' do
        click_on 'style'
        is_expected.to eq root_path
      end
      it 'aboutをおすとアバウトページへ遷移' do
        click_on 'About'
        is_expected.to eq '/homes/about'
      end
      it 'guideをおすとガイドページへ遷移' do
        click_on 'Guide'
        is_expected.to eq '/homes/guide'
      end
    end
  end
end

describe 'about画面のテスト' do
  before do
    visit '/homes/about'
  end

  it '表示内容の確認' do
    expect(current_path).to eq '/homes/about'
  end
end

describe 'guide画面のテスト' do
  before do
    visit '/homes/guide'
  end

  it '表示内容の確認' do
    expect(current_path).to eq '/homes/guide'
  end
end

describe  '新規登録のテスト' do
  before do
    visit  new_user_registration_path
  end

  context '表示の確認' do
    it 'URLの確認' do
      expect(current_path).to eq '/users/sign_up'
    end
    it 'Sign upボタン表示' do
      expect(page).to have_button 'Sign up'
    end
  end

  context '一般新規登録テスト' do
    before do
     
    end


    it '正しく登録される' do
      expect { click_button 'Sign up' }.to change(User.count).by(1)
    end
  end
end

# RSpec.describe '一般ユーザー新規登録のテスト', type: :system do

#   let!(:user) { FactoryBot.build(:user) }
#   before do
#     choose 'user_is_user_true'
#     expect(page).to have_checked_field true
#   end


#   context '新規登録ができる時' do
#     it '正しい入力で登録されマイページに遷移' do
#       visit  new_user_registration_path
# choose 'user_is_user_true', with: 'true'
#       japanese_name = Gimei.name
#       fill_in 'user[name]', with: japanese_name.kanji
#       fill_in 'user[name_kana]', with: japanese_name.katakana
#       fill_in 'user[nick_name]', with: Faker::Lorem.characters(number: 10)
#       fill_in 'user[email]', with: Faker::Internet.email
#       fill_in 'user[password]', with: 'password'
#       fill_in 'user[password_confirmation]', 'password'

#       expect { click_button 'Sign up' }.to change(User.count).by(1)
#     end
#   end
# end

# end

# describe '店舗スタッフユーザー新規登録テスト' do
#   before do
#     visit new_user_registration_path
#     expect(page).to have_checked_field 'user_is_user_true'
#     choose 'user_is_user_false'
#     expect(page).to have_checked_field 'user_is_user_false'
#   end

#   context '店舗スタッフユーザー新規登録画面の確認' do
#     it 'URLの確認' do
#       expect(current_path).to eq '/users/sign_up'
#     end
#     it 'nameフォームが表示される' do
#       expect(page).to have_field 'user[name]'
#     end
#     it 'name_kanaフォームが表示される' do
#       expect(page).to have_field 'user[name_kana]'
#     end
#     it 'nick_nameフォームが表示される' do
#       expect(page).to have_field 'user[nick_name]'
#     end
#   end
# end
