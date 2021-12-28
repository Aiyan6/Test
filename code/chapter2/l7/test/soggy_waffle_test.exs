defmodule SoggyWaffleTest do
  use ExUnit.Case
  
#file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget


  
  import Mox
  
  require Logger

  describe "rain?/2" do
    test "success: gets forecasts, returns true for imminent rain" do
      expect(SoggyWaffle.WeatherAPIMock, :get_forecast, 1, fn city ->
        assert city == "Los Angeles"

        response = %{
          "list" => [
            %{
              "dt" => DateTime.to_unix(DateTime.utc_now()) + 60,
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