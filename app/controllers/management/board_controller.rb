class Management::BoardController < ApplicationController
  def index
    @client = ::Client.find(params[:client_id])
    @boards = @client.boards
  end

  def new
    @client = ::Client.find(params[:client_id])
    @board = Board.new(:client_id => params[:client_id])
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      flash[:notice] = "Succeed create board!"
      redirect_to management_client_board_index_path(params[:client_id])
    else
      flash[:error] = "Failed create board!"
      redirect_to new_management_client_board_path(params[:client_id])
    end
  end

  def edit
    @client = ::Client.find(params[:client_id])
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(board_params)
      flash[:notice] = "Succeed update board!"
      redirect_to management_client_board_index_path(params[:client_id])
    else
      flash[:error] = "Failed update board!"
      redirect_to edit_management_client_board_path(params[:client_id], params[:id])
    end
  end

  def destroy
    board = Board.find(params[:id])

    if board.destroy
      flash[:notice] = "Succeed delete board!"
    else
      flash[:error] = "Failed delete board!"
    end
    redirect_to management_client_board_index_path(params[:client_id])
  end

  private
    def board_params
      params.require(:board).permit(:name, :client_id)
    end
end
