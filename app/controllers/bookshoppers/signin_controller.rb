class Bookshoppers::SigninController < ApplicationController
layout 'account'
def new
render template: 'bookshoppers/sessions/new'
end
def newpass
@bookshopper=Bookshopper.findbyemailortel(bookshopper_params[:telemail])
render template: 'bookshoppers/sessions/newpath'
end
def create
@bookshopper=Bookshopper.findbyemail(bookshopper_params[:email])
if @bookshopper.valid_password?(bookshopper_params[:mypass])
bypass_sign_in(@bookshopper)
redirect_to after_sign_in_path_for(@bookshopper)
end
end
private
def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_url
end

def bookshopper_params
params.require(:bookshopper).permit(:telemail,:mypass,:email, :firstname, :lastname, :password, :password_confirmation)
end

end
