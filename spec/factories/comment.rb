FactoryBot.define do

    factory :comment do
      comment  {"コメント"}
      user
      post
    end
  
end