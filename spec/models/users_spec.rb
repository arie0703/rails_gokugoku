require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      @user.name = 'user'
      @user.email = 'goodexample@example.com'
      @user.password = 'xxxxxxx'
      expect(@user.valid?).to eq(true)
    end

    context 'name' do
      it 'nameが空だとNG' do
        @user.name = ''
        expect(@user.valid?).to eq(false)
      end
  
      it 'nameが16以上だと登録できない' do
        @user.name = 'a' * 16
        expect(@user.valid?).to eq(false)
      end
  
      it 'nameが15文字以内なら登録できる。' do
        @user.name = 'a' * 15
        expect(@user.valid?).to eq(true)
      end
    end

    context 'email' do
      it 'emailが空だとNG' do
        @user.email = ''
        expect(@user.valid?).to eq(false)
      end

    end

  end
end