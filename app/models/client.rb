class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
attr_accessor :telemail, :mypass
  devise :database_authenticatable#, :registerable,
         #:recoverable, :rememberable, :validatable
has_many :reviews
def namewithinitial
firstname+" "+lastname[0]
end
def fullname
firstname+" "+lastname
end
def self.findbyemailortel(e)
find_by(email: e) || find_by(tel: e)
end
def self.findbyemail(e)
find_by(email: e)
end
end
