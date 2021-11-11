require "test_helper"

class FutsalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @futsal = futsals(:one)
  end

  test "should get index" do
    get futsals_url
    assert_response :success
  end

  test "should get new" do
    get new_futsal_url
    assert_response :success
  end

  test "should create futsal" do
    assert_difference('Futsal.count') do
      post futsals_url, params: { futsal: { location: @futsal.location, name: @futsal.name } }
    end

    assert_redirected_to futsal_url(Futsal.last)
  end

  test "should show futsal" do
    get futsal_url(@futsal)
    assert_response :success
  end

  test "should get edit" do
    get edit_futsal_url(@futsal)
    assert_response :success
  end

  test "should update futsal" do
    patch futsal_url(@futsal), params: { futsal: { location: @futsal.location, name: @futsal.name } }
    assert_redirected_to futsal_url(@futsal)
  end

  test "should destroy futsal" do
    assert_difference('Futsal.count', -1) do
      delete futsal_url(@futsal)
    end

    assert_redirected_to futsals_url
  end
end
