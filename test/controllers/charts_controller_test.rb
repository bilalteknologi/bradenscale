require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get decisions_chart" do
    get charts_decisions_chart_url
    assert_response :success
  end

end
