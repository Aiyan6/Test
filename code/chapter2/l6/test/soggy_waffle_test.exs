#SoggyWaffle Test with Mox Stub
defmodule SoggyWaffleTest do
  use ExUnit.Case
  

#SoggyWaffle Test with Mox Stub
#file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget


  
  import ExUnit.CaptureLog
  import Mox
  
  require Logger

  describe "rain?/2" do
    test "success: gets forecasts, returns true for imminent rain" do
      stub(SoggyWaffle.WeatherAPIMock, :get_forecast, fn city ->
        Logger.info("Getting forecast for city: #{city}")

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

      log =
        capture_log(fn ->
          assert SoggyWaffle.rain?("Los Angeles", DateTime.utc_now())
        end)

      assert log =~ "Getting forecast for city: Los Angeles"
    end
  end





end