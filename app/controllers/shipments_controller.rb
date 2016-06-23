class ShipmentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  
  
  def index
    @shipments = Shipment.all.order(created_at: :desc).page(params[:page]).per(15)
  end
  
  def new
    @shipment = current_user.shipments.new
  end 
  
  def show

  end
  
  def create
    @shipment = current_user.shipments.new(the_shipment_parameters)
    if @shipment.save
    redirect_to @shipment
    flash[:notice] = "Your shipment has been saved"
    else
      flash[:alert] = "there was an error"
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
                                     :location, 
                                     :open_for_bids, 
                                     :winning_bid,
                                     :shipment_category_id)
  end
end



