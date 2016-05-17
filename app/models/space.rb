class Space

  include DataMapper::Resource 

  belongs_to :user

  property :id, Serial

end