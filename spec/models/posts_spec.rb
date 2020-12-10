require 'rails_helper'

RSpec.describe Post, type: :model do

    before do
      # factories/user.rb
      @user = FactoryBot.create(:user)
    end

    describe '通常動作の確認' do
      it "ファクトリーボットのユーザーは有効か" do
        user = @user
        expect(user).to be_valid
      end
  
      it "ログイン時に投稿できるか" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post).to be_valid
      end

    end

    

    describe 'バリデーションチェック' do
      it "title" do 
        user = @user
        post = user.posts.build(
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "body" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "product" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "maker" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "alcohol" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          body: "内容",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "rate" do 
        user = @user
        post = user.posts.build(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it "ログイン無しの投稿" do 
        post = Post.new(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          )
        expect(post.valid?).to eq(false)
      end
    end

    describe '文字数制限' do
      it 'titleは20字を超えるとエラー' do
        post = @user.posts.build(
          title: "T" * 21,
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it 'bodyは140字を超えるとエラー' do
        post = @user.posts.build(
          title: "タイトル",
          body: "B" * 141,
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it 'productは20字を超えるとエラー' do
        post = @user.posts.build(
          title: "タイトル",
          body: "内容",
          alcohol: "弱(3%以下)",
          product: "P" * 21,
          maker: "サントリー",
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

      it 'makerは20字を超えるとエラー' do
        post = @user.posts.build(
          title: "タイトル",
          body: "B" * 141,
          alcohol: "弱(3%以下)",
          product: "ほろよい",
          maker: "M" * 21,
          rate: "4",
          user_id: 1
          )
        expect(post.valid?).to eq(false)
      end

    end

    
end