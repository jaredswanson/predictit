require './test/test_helper'

# TODO - stubs instead of calling the API
class MarketsTest < Minitest::Test
  def all
    @all ||= PredictIt::Markets.all
  end

  def first_market
    all.first
  end

  def market
    @market ||= PredictIt::Markets.market(first_market.id)
  end

  def test_self_all
    assert_equal(all.class, Array)
    assert_equal(first_market.id.class, Integer)
  end

  def test_self_market
    assert_equal(market.id.class, Integer)
  end

  # def test_markets
  #   # Can infer this is working if test_self_markets is working
  # end

  # def test_market
  #   # Can infer this is working if test_self_market is working
  # end
end
