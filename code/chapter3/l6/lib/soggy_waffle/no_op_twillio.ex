defmodule SoggyWaffle.NoOpTwilio do 
  #file path -> soggy_waffle/lib/soggy_waffle/no_op_twilio.ex
#add this code at the indicated place mentioned in comments of soggy_waffle/lib/soggy_waffle/twilio_interface.ex
#in the playground widget
  @behaviour SoggyWaffle.Twilio.Behaviour

  @impl true
  def send_sms(_phone_number, _text), do: :ok
end