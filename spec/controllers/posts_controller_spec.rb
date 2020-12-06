require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    

    describe 'Post #index' do
        it "投稿一覧ページにアクセス" do
            get :index
            expect(response).to be_successful
        end
    end


    describe 'Post #create' do

        before do
            @user = FactoryBot.create(:user)
        end

        context "ログインしている場合" do

            before do
                sign_in @user
            end
        
            it '投稿する' do
                
                #postのインスタンスをpost_paramsに格納する。
                post_params = FactoryBot.attributes_for(:post)
        
                expect {
                    post :create, params: { post: post_params }
                }.to change(@user.posts, :count).by(1)
            end

            it '無効な属性値の場合は投稿できない' do
                
                #postのインスタンスをpost_paramsに格納する。
                post_params = FactoryBot.attributes_for(:post, title: nil)
        
                expect {
                    post :create, params: { post: post_params }
                }.to_not change(@user.posts, :count)
            end

        end

        context "ログインしていない場合" do
        
            it '投稿数は増えない' do
                
                post_params = FactoryBot.attributes_for(:post)
        
                expect {
                    post :create, params: { post: post_params }
                }.to_not change(@user.posts, :count)
            end

        end

        
    
    end


    describe "Post #update" do
        before do
            @user = FactoryBot.create(:user)
            @post = FactoryBot.create(:post, user: @user)
        end

        it "投稿者本人がログイン済なら投稿が更新できる" do
            sign_in @user
            post_params = FactoryBot.attributes_for(:post, title: "new post")

            patch :update, params: { id: @post.id,post: post_params }
            # @postのtitleカラムを更新し、"new post"になっているか
            expect(@post.reload.title).to eq "new post"
        end
    end

    describe "Post #destroy" do
        before do
            @user = FactoryBot.create(:user)
            @post = FactoryBot.create(:post, user: @user)
        end

        it "投稿者本人がログイン済なら投稿が消せる。" do
            sign_in @user

            expect {
                delete :destroy, params: { id: @post.id }
            }.to change(@user.posts, :count).by(-1)
        end
    end


end
