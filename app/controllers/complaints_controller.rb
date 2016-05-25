class ComplaintsController < ApplicationController
	skip_before_filter  :verify_authenticity_token

  def endorse
  	Complaint.increment_counter(:rating, params[:id])
  	render json: { rating: Complaint.find(params[:id]).rating }, status: 200
  end
end
