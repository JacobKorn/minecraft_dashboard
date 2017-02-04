class VisitorsController < ApplicationController

  def index
    droplet_ids = RegisteredDroplet.pluck(:droplet_id)
    @droplets = droplet_ids.map {|id| Droplet.find(id)}
  end

end
