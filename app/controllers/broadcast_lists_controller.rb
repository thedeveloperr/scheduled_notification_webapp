class BroadcastListsController < ApplicationController
  def new
    @broadcast_list = BroadcastList.new
    render 'new'
  end

  def index
    @broadcast_lists = BroadcastList.where(event_code: params[:event_code]) || []
  end

  def show
    @message = Message.new
    @broadcast_list = BroadcastList.find(params[:id])
  end

  def create
    @broadcast_list = BroadcastList.new(broadcast_list_params)
    if @broadcast_list.save
      redirect_to @broadcast_list
    else
      render 'new'
    end
  end

  private

  def broadcast_list_params
    params.required(:broadcast_list).permit(:event_code, :name,
                                            :recipients_list)
  end
end
