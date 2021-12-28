defmodule SoggyWaffle.FakeWeatherAPI do
  require Logger

  @behaviour SoggyWaffle.WeatherAPI.Behavior
  @spec get_forecast(String.t()) :: {:ok, map()}
  def get_forecast(city) do
    _ = Logger.info("Getting forecast for city: #{city}")

    response = %{
      "list" => [
        %{
          "dt" => DateTime.to_unix(DateTime.utc_now()),
          "weather" => [%{"id" => _thunderstorm = 231}]
        }
      ]
    }

    [:ok, response]
  end
end