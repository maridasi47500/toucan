class Bookshoppers::SignupController < ApplicationController
layout 'account'
def new
render 'bookshoppers/registrations/new'
end
def create
@bookshopper=Bookshopper.new(bookshopper_params)
if @bookshopper.save
redirect_to after_sign_in_path_for(@bookshopper)
else
p @bookshopper.errors
render 'bookshoppers/registrations/new'
end
end
private
def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_url
end

def bookshopper_params
params.require(:bookshopper).permit(:email, :firstname, :lastname, :password, :password_confirmation)
end


end
