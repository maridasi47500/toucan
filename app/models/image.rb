class Image < ApplicationRecord
has_many :reviewimages
has_many :reviews, through: :reviewimages
end
