FactoryBot.define do
  factory :group do
    name { 'Test Group' }
    icon { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/rails.png'))) }
  end
end
