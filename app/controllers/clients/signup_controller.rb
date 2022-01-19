class Clients::SignupController < ApplicationController
layout 'account'
def new
render 'clients/registrations/new'
end
def create
@client=Client.new(client_params)
if @client.save
redirect_to after_sign_in_path_for(@client)
else
p @client.errors
render 'clients/registrations/new'
end
end
private
def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_url
end

def client_params
params.require(:client).permit(:email, :firstname, :lastname, :password, :password_confirmation)
end

end
