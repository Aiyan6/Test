defmodule SoggyWaffle.WeatherCheckerTest do
  use ExUnit.Case, async: false

  import Mox

  setup [:set_mox_from_context, :verify_on_exit!]

  test "when the process \"ticks\", the Twilio interface is called" do
    
    interval_in_ms = 5
    phone_number = "+1 111 11 1111"
    test_pid = self()
    ref = make_ref()

    start_options = [
      # The :mode option is set explicitly for testing.
      mode: :manual,
      interval: interval_in_ms,
      city: "Los Angeles",
      phone_number: phone_number
    ]

    pid = start_supervised!({SoggyWaffle.WeatherChecker, start_options})
    #file path -> soggy_waffle/test/soggy_waffle/weather_checker_with_mode_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle/weather_checker_with_mode_test.exs
#in the playground widget
    Mox.stub_with(SoggyWaffle.TwilioMock, SoggyWaffle.NoOpTwilio)
    expect(SoggyWaffle.TwilioMock, :send_sms, fn to, text ->
      assert to == phone_number
      # TODO: assert on text
      send(test_pid, {:send_sms_called, ref})
      :ok
    end)
    
    send(pid, :tick)

    assert_receive {:send_sms_called, ^ref}
  end
end