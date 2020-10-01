require "yaml"

namespace :postcards do
  desc "Load voters from a YAML file"
  task load_voters: [:environment] do
    data = YAML.load($stdin)
    campaign = Campaign.first

    data.each do |d|
      Address.create(address: d, campaign: campaign)
    end
  end
end
