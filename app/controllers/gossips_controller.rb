class GossipsController < ApplicationController
  before_action :logged_in_user

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = current_user.gossips.new
  end

  def create
    @gossip = current_user.gossips.create(gossip_params)
    if @gossip.errors.any?
      redirect_to new_gossip_path, danger: "Une erreur est survenue, réessayer de créer un potin ✘"
    else
      redirect_to gossips_path, success: "Ton potin a été créé avec succès ✔ "
    end
  end

  def edit
    @gossip = current_user.gossips.find(params[:id])
  end

  def update
    @gossip = current_user.gossips.find(params[:id])
    if @gossip.update_attributes(gossip_params)
      redirect_to @gossip, success: "Ton potin a été modifié avec succès ✔ "
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    redirect_to root_path, success: "Ton potin a été supprimé avec succès ✔ "
  end
#=======================================================================================================================
  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
