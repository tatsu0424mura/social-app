class HomeController < ApplicationController
  layout 'landing'

  def welcome
    @network = Network.new
    @networks = Network.all
  end

end
