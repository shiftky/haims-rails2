require 'open-uri'
require 'json'

class DeviceController < ApplicationController
  def index
    @board = Board.includes(:client).where(:name => "main").first
    @address = @board.client.address
    @port = @board.client.port

    json = JSON.parser.new(open("http://#{@address}:#{@port}/haims/api/sensors?board=main").read)
    result = json.parse

    @temp = result["temp"]
    @illumi = result["illumi"]
    @devices = Device.includes(:ir_signals).all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      flash[:notice] = "Succeed create device!"
      redirect_to device_index_path
    else
      flash[:error] = "Failed create device!"
      render new_device_path
    end
  end

  def edit
    @device = Device.includes(:ir_signals).find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    if @device.update_attributes(device_params)
       flash[:notice] = "Succeed update device!"
      redirect_to device_index_path
    else
      flash[:error] = "Failed update device!"
      redirect_to edit_device_path(@device.id)
    end
  end

  def destroy
    device = Device.find(params[:id])

    if device.destroy
      flash[:notice] = "Succeed delete device!"
    else
      flash[:error] = "Failed delete device!"
    end
    redirect_to device_index_path
  end

  private
    def device_params
      params.require(:device).permit(:name, :comment)
    end
end
