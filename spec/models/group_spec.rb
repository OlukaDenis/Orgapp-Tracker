require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = create(:user)
    @group = @user.author_groups.build(name: 'Test Group',
                                       icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
                                                                                              '/spec/fixtures/images/rails.png'))))
  end

  it 'has to be valid' do
    expect(@group).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    # Not to allow nil values
    it { expect(@group).not_to allow_value(nil).for(:name) }
  end

  describe 'associations' do
    it { should have_many(:projects).dependent(:destroy) }
    it { should have_many(:groupings) }
    it { should belong_to(:author) }
  end
end
