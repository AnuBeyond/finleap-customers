class CustomersController < ApplicationController
  include DataReader

  def index
    respond_to do |format|
      format.html
      format.json {
        render json: CustomerDatatable.new(view_context, @data)
       }
    end
  end

end
