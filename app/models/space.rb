class Space

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, String, :length => 500
  property :price, Integer

  belongs_to :user

end
