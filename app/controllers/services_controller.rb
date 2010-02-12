class ServicesController < ApplicationController
  def edit
    @service = Service.find(params[:id])
  end
  
  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      redirect_to edit_service_path(@service), :notice => "Service updated"
    else
      render 'edit'
    end
  end
end
