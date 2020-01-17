require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../Drinks.rb' )

class TestDrinks < Minitest::Test

  def setup
    @drink1 = Drink.new("Beer", 5)
  end

  def test_get_drink_type
    assert_equal("Beer", @drink1.type)
  end

  def test_get_drink_cost
    assert_equal(5, @drink1.cost)
  end

end
