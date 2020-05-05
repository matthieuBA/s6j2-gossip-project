class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    #flash.now[:notice] = "We have exactly #{@gossips.size} books available."

  end

  def show
    #@gossips = Gossip.find_by(id:params[:id])
    @gossips = Gossip.find_by(id: params[:id])
  end

  def new
    @gossips = Gossip.new
  end

  def create
    @gossips = Gossip.create(title: params[:gossip_title], content: params[:gossip_content], user_id: 1)

    if @gossips.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      # flash[:notice] = "Post successfully created"
      # gflash :success => "The product has been created successfully!"
      flash["success"] = "Gossip successfully created!"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash["error"] = "Post don't created"
      render new_gossip_path
    end
  end
end
