require 'rails_helper'

RSpec.describe Fotocomment, type: :model do
    before do 
        @fotocomment = build(:fotocomment)
    end

    it 'コメントできてるか？' do
        expect(@fotocomment.valid?).to eq(true)
    end

    describe 'バリデーション' do
        it 'コメントが空欄' do
            @fotocomment.fotocomment = ""
            expect(@fotocomment.valid?).to eq(false)
        end

        it '文字数が140を超える' do
            @fotocomment.fotocomment = "a" * 141
            expect(@fotocomment.valid?).to eq(false)
        end

    end

end