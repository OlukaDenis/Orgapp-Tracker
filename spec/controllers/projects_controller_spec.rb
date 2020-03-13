require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  context 'GET #index' do
    describe 'redirect to signin if not logged in' do
      before { get :index }
      it { should redirect_to(signin_path) }
    end
  end
end
