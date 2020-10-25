module DataReader
  extend ActiveSupport::Concern

  included do
    before_action :read_from_file
  end

  private

  def read_from_file
    return unless request.format.json?
    @data = []
    File.foreach('db/finleap-connect-customers.json').map do |record|
      @data << JSON.parse(record)
    end
  end
end
