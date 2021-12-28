defmodule SoggyWaffle.Twilio.Behaviour do
  @callback send_sms(phone_number :: String.t(), text :: String.t()) ::
              :ok | {:error, reason :: term()}
end

defmodule SoggyWaffle.Twilio do
  @behaviour SoggyWaffle.Twilio.Behaviour

  @impl true
  def send_sms(phone_number, text)
      when is_binary(phone_number) and is_binary(text) do
        Mox.defmock(SoggyWaffle.TwilioMock, for: SoggyWaffle.Twilio.Behaviour)
    # Make calls to the Twilio API here
  end
end  