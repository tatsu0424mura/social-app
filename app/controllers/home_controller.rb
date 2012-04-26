class HomeController < ApplicationController
  layout 'landing'

  def welcome
    @network = Network.new
  end

end
