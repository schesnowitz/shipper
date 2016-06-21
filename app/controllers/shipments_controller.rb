class ShipmentsController < ApplicationController
  
  def index
  end
  
  def new
    @shipment = Shipment.new
  end 
  
  def show
    @shipment = Shipment.find(params[:id])
  end
  
  def create
    @shipment = Shipment.new(the_shipment_parameters)
    @shipment.user = current_user
    if @shipment.save
    redirect_to @shipment
    flash[:notice] = "Your shipment has been saved"
    else
      flash[:alert] = "there was an error"
      render :new
    end
  end
  
  
  private 
  
  def the_shipment_parameters
    params.require(:shipment).permit(:name, 
                                     :description, 
                                     :budget, 
                                     :location, 
                                     :open_for_bids, 
                                     :winning_bid)
  end
end



