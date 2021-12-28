defmodule SoggyWaffle.WeatherAPI.Behavior do
   

#file path -> soggy_waffle/lib/soggy_waffle/weather_api/weather_api_behavior.ex
#add this code at the indicated place mentioned in comments of soggy_waffle/lib/soggy_waffle/weather_api/weather_api_behavior.ex
#in the playground widget
  @callback get_forecast(city :: String.t()) ::
              {:ok, term()} | {:error, term()}


end