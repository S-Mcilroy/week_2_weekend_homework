require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../Guests.rb' )

class TestGuests < Minitest::Test

  def setup
    @Steven = Guest.new("Steven", "Rasputin - Boney M", 100)
  end

  def test_can_get_name_guest
    assert_equal("Steven", @Steven.name)
  end

  def test_can_get_favorite_song
    assert_equal("Rasputin - Boney M", @Steven.favorite_song)
  end

  def test_can_get_cash_amount
    assert_equal(100, @Steven.cash)
  end

  def test_can_reduce_cash
    @Steven.charged(50)
    assert_equal(50, @Steven.cash)
  end

end
