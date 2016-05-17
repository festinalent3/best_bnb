class Space

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, String, :length => 500

  belongs_to :user
  
end
