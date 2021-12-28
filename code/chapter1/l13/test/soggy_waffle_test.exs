defmodule SoggyWaffleTest do
  use ExUnit.Case


#file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget
  describe "rain?/2" do
    test "success: gets forecasts, returns true for imminent rain" do
      now = DateTime.utc_now()
      future_unix = DateTime.to_unix(now) + 1
      expected_city = Enum.random(["Denver", "Los Angeles", "New York"]) 
      test_pid = self()

      weather_fn_double = fn city -> 
        send(test_pid, {:get_forecast_called, city}) 

        data = [
          %{
            "dt" => future_unix,
            "weather" => [%{"id" => _drizzle_id = 300}]
          }
        ]

        {:ok, %{"list" => data}}
      end

      assert SoggyWaffle.rain?(expected_city, now, weather_fn_double)

      assert_received {:get_forecast_called, ^expected_city}, 
                      "get_forecast/1 was never called"
    end
  end



end