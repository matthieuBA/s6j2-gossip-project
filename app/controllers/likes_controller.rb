class LikesController < ApplicationController
  def new
    @like = Like.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    likes = Like.all.where(gossip_id: params[:gossip_id], user_id: session[:user_id]).count
    if likes < 1
      @like = @gossip.likes.new(gossip_id: params[:gossip_id], user_id: session[:user_id])
      @like.user_id = session[:user_id]
      @like.gossip_id = @gossip.id
      if @like.save
        redirect_to gossip_path(@gossip.id)
      end
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    if @gossip.likes.delete(params[:id])
      redirect_to gossip_path(@gossip.id)
    end
  end

  def show
    @like = Like.new
    @gossip = Gossip.find(params[:id])

    @gossip_likes_count = @gossip.likes.all.count
    @gossip_likes = @gossip.likes.all
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end
end
