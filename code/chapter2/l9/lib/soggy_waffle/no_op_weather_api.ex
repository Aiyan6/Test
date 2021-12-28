defmodule SoggyWaffle.NoOpWeatherAPI do
 

#file path -> soggy_waffle/lib/soggy_waffle/no_op_weather_api.ex
#add this code at the indicated place mentioned in comments of soggy_waffle/lib/soggy_waffle/no_op_weather_api.ex
#in the playground widget
  @behavior SoggyWaffle.WeatherAPI.Behavior

  @spec get_forecast(String.t()) :: {:ok, map()}
  def get_forecast(city) do
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