class StaticController < ApplicationController
  def index
    Gossip.all
  end

  def team
  end

  def contact
  end
end
