require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe 'Post #index' do
        it "投稿一覧ページにアクセス" do
            get :index
            expect(response).to be_successful
        end
    end

    describe 'Post #create' do
        context "@postが保存できた時" do
    
        it "データベースに値が保存される" do
            sign_in @user
            expect{
                post :create, params: {
                    post: {
                        title: "ほろよい",
                        body: "最高！",
                        product: "ほろよい",
                        maker: "サントリー",
                        rate: 5,
                        alcohol: "弱(3%以下)",
                        user_id: 1
                    }
                }
            }.to change(@user.post, :count).by(1)
        end
    
        it "正しいビューに変遷する" do
        end
    
        end
    
        context "@postが保存できなかった時" do
    
        it "データベースに値が保存されない" do
        end
    
        it "正しいビューに変遷する" do
        end
    
        end
    
    end

    describe 'Post #destroy' do
        it "deletes the post" do
          
          expect{
            post :destroy, id: post
          }.to change(Post,:count).by(-1)
        end
    end
end
