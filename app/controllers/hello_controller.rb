class HelloController < ApplicationController


    def index
        #評価４以上の投稿をランダムに１件表示する
        @random = Post.order("RANDOM()").where("rate > 3").first
    end

    def link
    end


end
