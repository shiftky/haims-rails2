class Management::ClientController < ApplicationController
  def index
    @clients = ::Client.all
  end

  def new
    @client = ::Client.new
  end

  def create
    @client = ::Client.new(client_params)

    if @client.save
      flash[:notice] = "Succeed create client!"
      redirect_to management_client_index_path
    else
      flash[:error] = "Failed create client!"
      render new_management_client_path
    end
  end

  def edit
    @client = ::Client.find(params[:id])
  end

  def update
    @client = ::Client.find(params[:id])

    if @client.update_attributes(client_params)
      flash[:notice] = "Succeed update client!"
      redirect_to management_client_index_path
    else
      flash[:error] = "Failed update client!"
      redirect_to edit_management_client_path_edit(params[:id])
    end
  end

  def destroy
    client = ::Client.find(params[:id])

    if true
      flash[:notice] = "Succeed delete client!"
    else
      flash[:error] = "Failed delete client!"
    end
    redirect_to management_client_index_path
  end

  private
    def client_params
      params.require(:client).permit(:name, :address, :port)
    end
end
