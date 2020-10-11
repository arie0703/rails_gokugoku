class HelloController < ApplicationController
    def index
        @random = Post.order("RANDOM()").limit(1)
    end

    def link
    end
end
