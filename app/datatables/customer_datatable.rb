class CustomerDatatable < ApplicationDatatable

  private

  def data
    customers.map do |customer|
      [].tap do |column|
        column << customer['user_id']
        column << customer['name']
        column << customer['distance'] #this key is being merged into customer record during distance calcultion
      end
    end
  end

  def count
    @data.count
  end

  def total_entries
    fetch_data.count
  end

  def customers
    Kaminari.paginate_array(fetch_data).page(page).per(per_page)
  end

  def fetch_data
    distance = params[:distance] || 100
    filter_data = DistanceCalculator.call(@data, distance.to_i)
    filter_data = filter_data.select { |d| d['name'].downcase.include?(params[:search][:value].downcase) }
    filter_data = sort_direction == 'asc' ? filter_data.sort_by { |d| d[sort_column] } : filter_data.sort_by { |d| d[sort_column] }.reverse!
  end

  def columns
    %w(user_id name distance)
  end

end
