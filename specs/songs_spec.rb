require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../Songs.rb' )

class TestSongs < Minitest::Test

  def setup
    @song1 = Song.new("Rasputin - Boney M")
  end

  def test_can_get_name_of_song
    assert_equal("Rasputin - Boney M", @song1.name)
  end

end
