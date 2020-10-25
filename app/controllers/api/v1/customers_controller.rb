class Api::V1::CustomersController < Api::BaseController
  include DataReader

  def index
    distance = params[:distance] || 100
    data = DistanceCalculator.call(@data, distance.to_i)
    render json: { status: @data.blank? ? 422 : 200, data: data }
  end

end
