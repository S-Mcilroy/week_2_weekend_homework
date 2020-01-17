require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../Rooms.rb' )
require_relative( '../Songs.rb')
require_relative( '../Guests.rb')
require_relative( '../Drinks.rb')

class TestRooms < Minitest::Test

  def setup
    @Room = Room.new("Small Room", 3)
    @Guest1 = Guest.new("Steven", "Around the World - Daft Punk", 100)
    @Guest2 = Guest.new("Sally", "Random Song - Random Artist", 50)
    @Guest3 = Guest.new("Michael", "Another Song - Another Artist", 75)
    @Guest4 = Guest.new("Jack", "My Way - Limp Bizkit", 5)
    @Song1 = Song.new("Rasputing - Boney M")
    @Song2 = Song.new("Around the World - Daft Punk")
    @Drink1 = Drink.new("Beer", 5)
    @Drink2 = Drink.new("Wine", 10)
    @Drink3 = Drink.new("Whiskey", 15)
  end

  def test_can_get_room_name
    assert_equal("Small Room", @Room.name)
  end

  def test_can_get_capacity
    assert_equal(3, @Room.capacity)
  end

  def test_add_songs_to_room
    @Room.add_song(@Song1)
    @Room.add_song(@Song2)
    assert_equal(2, @Room.song_count)
  end

  def test_find_song
    @Room.add_song(@Song1)
    assert_equal(true, @Room.find_song("Rasputing - Boney M"))
  end

  def test_find_song__song_not_included
    assert_equal(false, @Room.find_song(@song1))
  end

  def test_can_add_guests
    @Room.add_guest(@Guest1)
    assert_equal(1, @Room.checked_guests)
  end

  def test_can_add_guests__not_enough_space
    @Room.add_guest(@Guest1)
    @Room.add_guest(@Guest2)
    @Room.add_guest(@Guest3)
    assert_equal("Unable to add no space/insufficent funds!", @Room.add_guest(@Guest4))
  end

  def test_can_add_guest__not_enough_cash
    assert_equal("Unable to add no space/insufficent funds!", @Room.add_guest(@Guest4))
  end

  def test_can_remove_guests
    @Room.add_guest(@Guest1)
    @Room.add_guest(@Guest2)
    @Room.remove_guest("Steven")
    assert_equal(1, @Room.checked_guests)
  end

  def test_can_increase_till_amount
    assert_equal(10, @Room.add_to_till(10))
  end

  def test_can_guest_find_favorite_song
    @Room.add_song(@Song2)
    assert_equal(1, @Room.song_count)
    assert_equal("Whoo!", @Room.add_guest(@Guest1))
    assert_equal(20, @Room.get_till_amount)
  end

  def test_can_add_drinks_to_room
    @Room.add_drink_to_room(@Drink1)
    @Room.add_drink_to_room(@Drink2)
    assert_equal(2, @Room.drink_count)
  end

  def test_can_guest_buy_drink
    @Room.add_drink_to_room(@Drink1)
    @Room.add_drink_to_room(@Drink2)
    @Room.buy_drink(@Guest1, "Beer")
    assert_equal(5, @Room.get_till_amount)
    assert_equal(95, @Guest1.cash)
  end


end
