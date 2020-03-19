require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end

  it 'has valid user attributes' do
    expect(@user).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    # Not to allow nil values
    it { expect(@user).not_to allow_value(nil).for(:name) }
  end

  it 'name has to be unique' do
    user1 = User.create(name: 'mcdenny')
    expect(user1).to be_invalid
  end

  describe 'associations' do
    it { should have_many(:author_groups).dependent(:destroy) }
    it { should have_many(:author_projects).dependent(:destroy) }
  end
end
