class DropletsController < ApplicationController

  def show
    @droplet = Droplet.find(params[:id])
  end

  def index
    @droplets = Droplet.all
  end

  def register
    droplet = Droplet.find(params[:droplet_id].to_i)
    RegisteredDroplet.create(name: droplet.name, droplet_id: droplet.id)
    redirect_to droplets_path, notice: "#{droplet.name} registered"
  end

  def deregister
    registered_droplet = RegisteredDroplet.find_by(droplet_id: params[:droplet_id])
    registered_droplet.destroy
    redirect_to droplets_path, notice: "#{registered_droplet.name} deregistered"
  end

end
