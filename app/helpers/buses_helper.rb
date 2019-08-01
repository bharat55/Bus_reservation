module BusesHelper
  def formate_time(time)
    time.strftime("%I:%M:%p")
  end
end
