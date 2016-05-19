class Space

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, String, :length => 500
  property :available_dates, Object
  property :requested_dates, Object
  property :booked_dates, Object
  property :price, Integer

  belongs_to :user

end
