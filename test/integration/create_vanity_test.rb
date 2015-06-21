require 'test_helper'

class CreateVanityTest < ActionDispatch::IntegrationTest
  
  test "create vanity success" do
  	get root_path

  	assert_difference 'Vanity.count', 1 do
  		post_via_redirect vanities_path, vanity: {vanity_url:"AwQERT",destination_url:"www.example.com/2h2h4d922hdjsKs4Gdsa65"}
  	end

  	assert_template 'page/index'
  end

  test "create vanity failed" do
  	get root_path

  	assert_no_difference 'Vanity.count' do
  		post vanities_path, vanity: {vanity_url:"",destination_url:"www.example.com/2h2h4d922hdjsKs4Gdsa65"}
  	end

  	assert_template 'page/index'
  end
end
