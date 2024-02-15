require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  describe 'name' do
    context '名前が空文字の場合' do
      before { user.name = '' }
      it 'バリデーションに失敗する' do
        expect(user).not_to be_valid
      end
    end
  end

  describe 'email' do
    context '有向なemailの場合' do
      before { user.email = 'test@example.com' }
      it do
        expect(user).to be_valid
      end
    end
  end

  describe 'password' do
    context 'パスワードが6文字以上の場合' do
      before { user.password = "a" * 8 }
      it do
        expect(user).to be_valid
      end
    end
  end
end
