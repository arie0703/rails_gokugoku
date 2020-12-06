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

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end