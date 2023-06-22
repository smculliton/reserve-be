class Restaurant 
  attr_reader :name, :cuisine, :hours, :id

  def initialize(data)
    @name = data[:properties][:name]
    @cuisine = data[:properties][:datasource][:raw][:cuisine] || 'vegan'
    @hours = data[:properties][:datasource][:raw][:opening_hours]
    @id = data[:properties][:datasource][:raw][:osm_id]
  end
end