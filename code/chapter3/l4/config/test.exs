import Mix.Config

config :soggy_waffle, :weather_api_module, SoggyWaffle.FakeWeatherAPI
config :soggy_waffle, :twilio_module, SoggyWaffle.TwilioMock