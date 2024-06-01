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
end
