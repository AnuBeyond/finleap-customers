require 'rails_helper'

RSpec.describe CustomersController, type: :request do

  describe "GET #index" do
    before do
      get api_v1_filter_customer_path
    end

    it 'response success' do
      expect(response).to be_successful
    end

    it 'include data array' do
      expect(response.body).to include("data")
    end

    it 'include request status' do
      expect(response.body).to include("status")
    end
  end

end
