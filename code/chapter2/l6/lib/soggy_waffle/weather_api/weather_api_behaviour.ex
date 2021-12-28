defmodule SoggyWaffle.WeatherAPI.Behavior do
  @callback get_forecast(city :: String.t()) ::
              {:ok, term()} | {:error, term()}
end