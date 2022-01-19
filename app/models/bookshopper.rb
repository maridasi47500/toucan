class Bookshopper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
attr_accessor :telemail, :mypass
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
