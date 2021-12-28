defmodule SoggyWaffle.WeatherAPITest do
  use ExUnit.Case
#file path -> soggy_waffle/test/soggy_waffle/weather_api_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle/weather_api_test.exs
#in the playground widget
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  #file path -> soggy_waffle/test/soggy_waffle/weather_api_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle/weather_api_test.exs
#in the playground widget

  test "get_forecast/1 hits GET /data/2.5/forecast" do
    query = "Los Angeles"
    app_id = "none"

    use_cassette "weather_api_successful_request" do
      assert {:ok, body} =
               SoggyWaffle.WeatherAPI.get_forecast("Los Angeles")

      assert %{"list" => [weather | _]} = body
      assert %{"dt" => _, "weather" => _} = weather
    end


    # potentially more assertions on the weather
  end
  
end