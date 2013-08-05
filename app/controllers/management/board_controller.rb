class Management::BoardController < ApplicationController
  def index
    @boards = ::Client.find(params[:client_id])
  end

  def new
  end

  def edit
  end
end
