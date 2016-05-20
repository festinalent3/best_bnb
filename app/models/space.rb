class Space

  include DataMapper::Resource
  belongs_to :user

  property :id, Serial
  property :title, String
  property :description, String, :length => 500
  property :available_dates, Object
  property :requested_dates, Object
  property :price, Integer

  def self.store_multiple_requests(space, check_in, check_out, user_id)
    new_values = Array.new.concat space.requested_dates
    new_values << DateRange.request_dates(check_in, check_out, user_id)
    space.attribute_set(:requested_dates, new_values)
    space.save
  end

end
