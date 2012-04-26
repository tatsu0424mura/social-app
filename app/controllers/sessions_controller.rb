class SessionsController < ApplicationController

  def new
    cookies[:key] = params[:network][:title].to_sym
    # @network = Network.create(params[:network])
    redirect_to '/auth/facebook' 
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                     :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    # Also find or create a new network here
    # Could probably use find_or_create_by_title(cookies[:key])? if @network.wtitle.present?
    network = Network.where(:title => cookies[:key])
    if network.empty?
      @network = Network.create(:title => cookies[:key])
      current_user.networks << @network
    else
      current_user.networks << network.first unless current_user.networks.include?(network.first)
    end
    cookies[:key] = "" 
    redirect_to networks_path, :notice => "Signed in!"
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

end
