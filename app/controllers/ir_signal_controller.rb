class IrSignalController < ApplicationController
  def new
    @ir_signal = IrSignal.new(:device_id => params[:device_id])
  end

  def create
    @ir_signal = IrSignal.new(ir_signal_params)

    if @ir_signal.save
      flash[:notice] = "Succeed create device!"
      redirect_to edit_device_path(params[:device_id])
    else
      flash[:error] = "Failed create device!"
      redirect_to new_device_ir_signal_path(params[:device_id])
    end
  end

  def edit
    @ir_signal = IrSignal.find(params[:id])
  end

  def update
    @ir_signal = IrSignal.find(params[:id])

    if @ir_signal.update_attributes(ir_signal_params)
      flash[:notice] = "Succeed update device!"
      redirect_to edit_device_path(params[:device_id])
    else
      flash[:error] = "Failed update device!"
      redirect_to edit_device_ir_signal_path(params[:device_id], @ir_signal.id)
    end
  end

  def destroy
    ir_signal = IrSignal.find(params[:id])

    if ir_signal.destroy
      flash[:notice] = "Succeed delete device!"
    else
      flash[:error] = "Failed delete device!"
    end
    redirect_to edit_device_path(params[:device_id])
  end

  def send_ir
    if true
      flash[:notice] = "Succeed Send IR Signal!"
    else
      flash[:error] = "Failed Send IR Signal!"
    end
    redirect_to device_index_path
  end

  private
    def ir_signal_params
      params.require(:ir_signal).permit(:name, :signal, :device_id, :board_id)
    end
end
