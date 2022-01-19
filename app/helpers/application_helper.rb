module ApplicationHelper
def resourceclient
current_client || Client.new
end
def resourceclient_name
:client
end
end
