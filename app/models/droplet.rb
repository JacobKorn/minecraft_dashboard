class Droplet

  def self.all
    droplet = new
    droplet.client.droplets.all.entries
  end

  def self.find(id)
    droplet = new
    droplet.client.droplets.find(id: id)
  end

  def self.power_down(id)
    client = new.client
    client.droplet_actions.power_off(droplet_id: id)
  end

  def self.power_up(id)
    client = new.client
    client.droplet_actions.power_on(droplet_id: id)
  end

  def initialize
    @client = DropletKit::Client.new(access_token: ENV["DIGITAL_OCEAN_TOKEN"])
  end

  attr_reader :client

  private

end
