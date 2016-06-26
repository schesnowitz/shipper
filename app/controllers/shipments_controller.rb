class ShipmentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  
  
  def index
    @shipments = Shipment.all.order(created_at: :desc).page(params[:page]).per(15)
  end
  
  def new
    @shipment = current_user.shipments.new
    @shipment.destinations.new 
  end 
  
  def show
    @destination = Destination.find(params[:id]) 
  end
  
  def create
    @shipment = current_user.shipments.new(the_shipment_parameters)
    @shipment.destinations.first.user_id = current_user.id
    if @shipment.save
    redirect_to @shipment
    flash[:notice] = "Your shipment has been saved"
    else
      flash[:alert] = "There was a problem sporto"
      render :new
    end
  end
  
  def edit

  end
  
  def update
    if @shipment.update(the_shipment_parameters)
    redirect_to @shipment
    flash[:notice] = "Your shipment has been updated"
    else
      flash[:alert] = "there was an problem updating your shipment."
      render :edit
    end
  end
  
    def destroy
      if @shipment.destroy
      redirect_to root_url
      flash[:notice] = "Your shipment has been deleted"
    end
  end
  
  def search
    @shipments = Shipment.search(params).page(params[:page]).per(15)
  end
  
  
  private 
  
  def find_id
    @shipment = Shipment.find(params[:id])
  end
  
  
  def the_shipment_parameters
    params.require(:shipment).permit(:name, 
                                     :description, 
                                     :budget, 
                                     :open_for_bids, 
                                     :winning_bid,
                                     :shipment_category_id,
                                     :origin_street_address,
                                     :origin_city,
                                     :origin_state_provence,
                                     :origin_postal_code,
                                     destinations_attributes: [:destination_state_provence,
                                     :destination_city,
                                     :destination_state_provence,
                                     :destination_postal_code])
                                     
  end
end



