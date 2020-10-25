require 'rails_helper'

RSpec.describe CustomersController, type: :request do

  describe "GET #index" do
    before do
      get customers_path
    end

    it 'response success' do
      expect(response).to be_successful
    end

    it 'include data array' do
      expect(response.body).to include("data")
    end
  end

end
