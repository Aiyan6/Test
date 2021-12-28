defmodule SoggyWaffle.WeatherAPI do


#file path -> soggy_waffle/lib/soggy_waffle/weather_api.ex
#add this code at the indicated place mentioned in comments of soggy_waffle/lib/soggy_waffle/weather_api.ex
#in the playground widget
  @default_base_url "https://api.openweathermap.org"

  @spec get_forecast(String.t(), String.t()) ::
          {:ok, map()} | {:error, reason :: term()}
  def get_forecast(city, base_url \\ @default_base_url)
      when is_binary(city) do
    app_id = "none"#SoggyWaffle.api_key()
    query_params = URI.encode_query(%{"q" => city, "APPID" => app_id})
    url = base_url <> "/data/2.5/forecast?" <> query_params

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200} = response} ->
        {:ok, Jason.decode!(response.body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, {:status, status_code}}

      {:error, reason} ->
        {:error, reason}
    end
  end

end