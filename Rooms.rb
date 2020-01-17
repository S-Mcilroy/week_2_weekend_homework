require('pry')

class Room

  attr_reader :name, :capacity

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @songs = []
    @guests = []
    @bar = []
    @entry_fee = 20
    @till = 0
  end

  def add_song(song)
    @songs.push(song)
  end

  def add_drink_to_room(drink)
    @bar.push(drink)
  end

  def drink_count
    return @bar.count
  end

  def buy_drink(guest, type_drink)
    for drink in @bar
      if drink.type == type_drink
        guest.charged(drink.cost)
        add_to_till(drink.cost)
      end
    end
  end

  def song_count
    return @songs.count
  end

  def get_till_amount
    return @till
  end

  def find_song(searched_song)
    for song in @songs
      if song.name == searched_song
        return true
      end
    end
    return false
  end

  def checked_guests
    return @guests.count
  end

  def add_to_till(value)
    @till += value
  end

  def add_guest(guest)
    if checked_guests() < @capacity && guest.cash >= @entry_fee
      @guests.push(guest)
      guest.charged(@entry_fee)
      add_to_till(@entry_fee)
      if find_song(guest.favorite_song) == true
        return "Whoo!"
      end
    else
      return "Unable to add no space/insufficent funds!"
    end
  end

  def remove_guest(guest_to_remove)
    for guest in @guests
      if guest.name == guest_to_remove
        @guests.delete(guest)
      end
    end
  end


end
