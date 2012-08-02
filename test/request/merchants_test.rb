require 'test_helper'

class MerchantsTest < MiniTest::Unit::TestCase
  include Capybara::DSL

  def setup
    Capybara.app = App
    Merchant.delete_all
    @merchant = Merchant.create(:name => "First Merchant", :address => "Calle Falsa 123", :phone => "55555555")
  end

  def test_merchants_list
    visit '/merchants'
    assert_match "First Merchant", page.body
  end

  def test_merchant_creation
    visit '/merchants/new'
    fill_in "merchant[name]", :with => "Second Merchant"
    fill_in "merchant[address]", :with => "Centro de las Americas"
    fill_in "merchant[phone]", :with => "12345678"
    click_button "Submit"

    assert_match "Second Merchant", page.body
  end
end
