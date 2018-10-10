class Journey_log
  attr_reader :previous_journey

  def
    initialize
      @previous_journey = {}
  end

  def start
    @previous_journey = {:entry_station => "oldstreet"}
  end

  def current_journey
    @previous_journey
  end

  def finish
    @previous_journey[:exit_station] = "barbican"
  end

  def all_journeys
    puts @previous_journey
    return "start #{@previous_journey[:entry_station]} end #{@previous_journey[:exit_station]}"
  end
end
