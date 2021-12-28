defmodule SoggyWaffle.WeatherAPI do
  @default_base_url "https://api.openweathermap.org"

  @spec get_forecast(String.t(), String.t()) ::
          {:ok, map()} | {:error, reason :: term()}
  def get_forecast(city, base_url \\ @default_base_url)
      when is_binary(city) do
    app_id = "2e92c9bf42a01f4b0369dfc90b71548c" #SoggyWaffle.api_key()
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