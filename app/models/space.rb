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

  def req_dates
    return self.requested_dates
  end

end
