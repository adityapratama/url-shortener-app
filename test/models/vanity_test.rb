require 'test_helper'

class VanityTest < ActiveSupport::TestCase
  def setup
  	@vanity = Vanity.new(vanity_url:"urlTest", destination_url:"www.example.com/UDbnf5327dsSd")
  end 
  test "should be valid" do
  	assert @vanity.valid?
  end

  test "vanity_url must be present" do
  	@vanity.vanity_url = "   "
  	assert_not @vanity.valid?
  end

  test "vanity_url must be uniq" do
  	dup_vanity = @vanity.dup
  	@vanity.save
  	assert_not dup_vanity.valid?
  end

  test "destination_url must be present" do
  	@vanity.destination_url = "   "
  	assert_not @vanity.valid?
  end

  test "vanity_url length not more than 50 " do
  	@vanity.vanity_url = "a" * 51
  	assert_not @vanity.valid?
  end

  test "destination_url length not more than 255 " do
  	@vanity.destination_url = "a" * 256
  	assert_not @vanity.valid?
  end
end
