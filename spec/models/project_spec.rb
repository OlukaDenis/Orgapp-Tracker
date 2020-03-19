require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:all) do
    @user = create(:user)
    @project = @user.author_projects.build(name: 'Test Project', duration: 5)
  end

  it 'has to be valid' do
    expect(@project).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:duration) }

    # Not to allow nil values
    it { expect(@project).not_to allow_value(nil).for(:name) }
    it { expect(@project).not_to allow_value(nil).for(:duration) }
  end

  describe 'associations' do
    it { should have_many(:groups).dependent(:destroy) }
    it { should have_many(:groupings) }
    it { should belong_to(:author) }
  end
end
