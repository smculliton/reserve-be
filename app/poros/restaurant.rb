class Restaurant 
  attr_reader :name, :cuisine, :hours, :id

  def initialize(data)
    @name = data[:properties][:name]
    @cuisine = data[:properties][:datasource][:raw][:cuisine] || 'vegan'
    @hours = data[:properties][:datasource][:raw][:opening_hours] #parse_hours(data[:properties][:datasource][:raw][:opening_hours])
    @id = data[:properties][:datasource][:raw][:osm_id]
  end

  def parse_hours(hours_string)
    hours_string = ('Mo-Su 12:00-20:00') if hours_string == nil

    array = hours_string.split(', ').map { |y| y.split(' ') }
    array = array.map do |a|
      hash = {}
      if a[0].include?('-')
        get_day_range(a[0]).each { |d| hash[d] = a[1] }
      else
        hash[a[0]] = a[1]
      end
      hash
    end
    array.reduce({}, :merge)
  end

  def get_day_range(str)
    range = str.split('-')
    dow = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
    dow = dow.rotate(-1) if range[0] == 'Su'

    dow[dow.index(range[0])..dow.index(range[1])]
  end
end