require './lib/oystercard.rb'

class Journey

  attr_reader :entry_station, :exit_station, :previous_journey, :all_journeys, :card


  def initialize
    @card = Oystercard.new
    @in_journey = false
    @previous_journey = {}
    @all_journeys = []
  end

  def touch_in(station, balance)
    raise "Error: balance below minimum" if balance < Oystercard::MIN_BALANCE
    @entry_station = station
    @previous_journey[:entry_station] = station
  end

  def touch_out(station)
    @exit_station = station
    @previous_journey[:exit_station] = station
    @all_journeys << @previous_journey
    @card.deduct(fare)
  end

  def in_journey?
    !@previous_journey[:entry_station].nil? && @previous_journey[:exit_station].nil?
  end

  def complete_journey?
    !(@previous_journey[:exit_station].nil? || @previous_journey[:entry_station].nil?)
  end

  def fare
    complete_journey? ? Oystercard::MIN_BALANCE : Oystercard::PENALTY
  end

end
