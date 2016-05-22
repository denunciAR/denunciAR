class HomeController < ApplicationController

  def index
  	@complaints = Complaint.all
  end
end
