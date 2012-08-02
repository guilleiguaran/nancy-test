require 'test_helper'

class MerchantTest < MiniTest::Unit::TestCase
  def test_presence_of_name
    merchant = Merchant.new(:address => "Calle Falsa 123", :phone => "55555555")
    assert_equal false, merchant.valid?
  end
end
