require 'rails_helper'

RSpec.describe Comment, type: :model do
    before do 
        @comment = build(:comment)
    end

    it 'コメントできてるか？' do
        expect(@comment.valid?).to eq(true)
    end

    describe 'バリデーション' do
        it 'コメントが空欄' do
            @comment.comment = ""
            expect(@comment.valid?).to eq(false)
        end

        it '文字数が140を超える' do
            @comment.comment = "a" * 141
            expect(@comment.valid?).to eq(false)
        end

    end

end