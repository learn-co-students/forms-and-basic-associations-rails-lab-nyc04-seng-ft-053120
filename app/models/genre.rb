class Genre < ActiveRecord::Base
  # add association
  has_many :songs
  has_many :artists, through: :songs
end
