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

  def power_down
    registered_droplet = RegisteredDroplet.find_by(droplet_id: params[:droplet_id])
    Droplet.power_down(registered_droplet.droplet_id)
    redirect_to root_path, notice: "Droplet #{registered_droplet.name} powered down"
  end

  def power_up
    registered_droplet = RegisteredDroplet.find_by(droplet_id: params[:droplet_id])
    Droplet.power_up(registered_droplet.droplet_id)
    redirect_to root_path, notice: "Droplet #{registered_droplet.name} powered up. Wait a few minutes and get yo minecraft on!"
  end

end
