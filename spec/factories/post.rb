FactoryBot.define do

    factory :post do
      title  {"user_name"}
      body  {"user_name"}
      product {"ほろよい"}
      maker {"サントリー"}
      rate {5}
      alcohol {"弱(3%以下)"}
      user_id {1}
    end
  
end