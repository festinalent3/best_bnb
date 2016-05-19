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
    hashi = []
    hashi.concat space.requested_dates
    hashi << DateRange.request_dates(check_in, check_out, user_id)
    space.update(:requested_dates => hashi)
  end



end
