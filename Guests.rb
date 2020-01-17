class Guest

  attr_reader :name, :favorite_song
  attr_accessor :cash

  def initialize(name, favorite_song, cash)
    @name = name
    @favorite_song = favorite_song
    @cash = cash
  end

  def charged(value)
    @cash -= value
  end

end
