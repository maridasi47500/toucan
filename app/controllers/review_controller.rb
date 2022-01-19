class ReviewController < ApplicationController
protect_from_forgery except: [:create]
before_action :authenticate_client!
layout 'review'
def loadreviews
@reviews=Review.bypage(params[:page],params[:sortby],params[:peoplenote])
render partial: 'review/reviewlist', collection: @reviews, as: :review, layout: false
end
def all

render layout: 'allreviews'
end
def index
@reviews=Review.bypage(1)
@nbreviews=Review.nbreviews
@notemoy=Review.notemoytoutes
@noteoften=Review.oftenreview
p @nbreviews
p @notemoy
render layout: false
end
def create
@review=Review.new(review_params)
if @review && @review.save
@review=Date.new(params['visited(1i)'].to_i,params['visited(2i)'].to_i,1)
@review.save
render plain: root_path
#else
#render plain: '/local/writereview'
end


end
def newreview
end
  def write
  end
private
def auth
if !client_signed_in?
redirect_to cnewlogin_path
end
end
def review_params
params.permit(:client_id, :content, :note,:visited, 'visited(2i)', 'visited(1i)',:visited=>{}, :images=>[])
end
end
