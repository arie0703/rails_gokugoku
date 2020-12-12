FactoryBot.define do

    factory :foto do
      title  {"title"}
      body  {"body"}
      image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/example.jpg'), 'image/jpg')}
    end
  
end