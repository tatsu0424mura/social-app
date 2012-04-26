class NetworksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @networks = current_user.networks
    # this should only show networks that belong to you
  end

  def new
    @network = Network.new 
  end

  def create
    @network = Network.create(params[:network]) 
    @network.users << User.find(params[:user_id])
    if @network.save
      redirect_to networks_path, notice: "Your network is now live!"
    else
      flash.now.alert = "Sorry there was an error creating your network."
      render "new"
    end
  end

  def show
     @network = current_user.networks.find(params[:id])
     if !@network.users.include?(current_user)
      @network.users << current_user 
     end
  end
  
  def remove
    @network = Network.find(params[:id])
    current_user.networks.delete(@network)
    redirect_to networks_path
  end

  def edit
    @network = Network.find(params[:id])
  end
     
  def update
    @network = Network.find(params[:id])
    if @network.update_attributes(params[:network])
      redirect_to networks_path
    else
      redirect_to :back, notice:  'There was an error updating the description.'
    end
  end
  
  def autocomplete
    @networks = Network.order(:title).where("title like ?", "%#{params[:term]}")
    render json: @networks.map(&:name)
  end

  def menu_klass
    if action_name == 'index'
      :index
    elsif action_name == 'new'
      :create_network
    else
      :blank
    end
  end

end
