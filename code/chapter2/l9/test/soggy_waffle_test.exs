defmodule SoggyWaffleTest do
  use ExUnit.Case

#file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget
  setup do
    current_weather_api_module =
      Application.get_env(
        :soggy_waffle,
        :weather_api_module,
        SoggyWaffle.WeatherAPI
      )

    Application.put_env(
      :soggy_waffle,
      :weather_api_module,
      SoggyWaffle.WeatherAPIMock
    )

    on_exit(fn ->
      Application.put_env(
        :soggy_waffle,
        :weather_api_module,
        SoggyWaffle.NoOpWeatherAPI
      )
    end)
  end

  # tests 
    

  import Mox
  
  require Logger

  describe "rain?/2" do
    test "success: gets forecasts, returns true for imminent rain" do
      #file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget
        Mox.stub_with(SoggyWaffle.WeatherAPIMock, SoggyWaffle.WeatherAPI)
        expect(SoggyWaffle.WeatherAPIMock, :get_forecast, 1, fn city ->
        assert city == "Los Angeles"

        response = %{
          "list" => [
            %{
              "dt" => DateTime.to_unix(DateTime.utc_now()) +  60,
              "weather" => [%{"id" => _thunderstorm = 231}]
            }
          ]
        }

        {:ok, response}
      end)

      assert SoggyWaffle.rain?("Los Angeles", DateTime.utc_now())

      verify!(SoggyWaffle.WeatherAPIMock)
    end
  end
end