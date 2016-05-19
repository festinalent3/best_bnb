class Space

  include DataMapper::Resource
  belongs_to :user

  property :id, Serial
  property :title, String
  property :description, String, :length => 500
  property :available_dates, Object
  property :requested_dates, Object
  property :booked_dates, Object
  property :price, Integer

  def self.store_multiple_requests(space, check_in, check_out, user_id)
    new_values = Array.new.concat space.requested_dates
    new_values << DateRange.request_dates(check_in, check_out, user_id)
    # The line below is impossible in unit tests as it returns the error message
    # #update cannot be called on a new resource
    # space.update(:requested_dates => new_values)

    # replaced it with the following:
    space.attribute_set(:requested_dates, new_values)
    space.save

  end

end
