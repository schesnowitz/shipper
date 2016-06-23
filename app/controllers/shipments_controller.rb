class ShipmentsController < ApplicationController
  
  def index
    @shipments = Shipment.all.order(created_at: :desc).page(params[:page]).per(15)
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
  
  def edit
    @shipment = Shipment.find(params[:id])
  end
  
  def update
    @shipment = Shipment.find(params[:id])
    @shipment.user = current_user
    if @shipment.update(the_shipment_parameters)
    redirect_to @shipment
    flash[:notice] = "Your shipment has been updated"
    else
      flash[:alert] = "there was an problem updating your shipment."
      render :edit
    end
  end
  
    def destroy
      @shipment = Shipment.find(params[:id])
      if @shipment.destroy
      redirect_to root_url
      flash[:notice] = "Your shipment has been deleted"
    end
  end
  
  def search
    @shipments = Shipment.search(params).page(params[:page]).per(15)
  end
  
  
  private 
  
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



