defmodule SoggyWaffleTest do
  use ExUnit.Case

  import ExUnit.CaptureLog
#file path -> soggy_waffle/test/soggy_waffle_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle_test.exs
#in the playground widget

  describe "rain?/2" do
    test "success: gets forecasts, returns true for imminent rain" do
      log =
        capture_log(fn ->
          SoggyWaffle.rain?("Los Angeles", DateTime.utc_now())
        end)

      assert log =~ "Getting forecast for city: Los Angeles"
    end
  end



end