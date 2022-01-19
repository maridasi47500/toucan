class Clients::SigninController < ApplicationController
layout 'account'
def new
render template: 'clients/sessions/new'
end
def newpass
@client=Client.findbyemailortel(client_params[:telemail])
render template: 'clients/sessions/newpath'
end
def create
@client=Client.findbyemail(client_params[:email])
if @client.valid_password?(client_params[:mypass])
bypass_sign_in(@client)
redirect_to after_sign_in_path_for(@client)
end
end
private
def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_url
end

def client_params
params.require(:client).permit(:telemail,:mypass,:email, :firstname, :lastname, :password, :password_confirmation)
end
end
