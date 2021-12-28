
defmodule SoggyWaffle.WeatherAPI do
  @behaviour SoggyWaffle.WeatherAPI.Behaviour
  
  @impl true
  def get_forecast(city) when is_binary(city) do
    app_id = "b393884ff6f1fee089bbb790cc6a7a49&q"
    city = String.replace(city," ","+")
    query_params = "q=" <> city <> "&appid=" <> app_id

    url =
      "https://api.openweathermap.org/data/2.5/forecast?" <> query_params

      
      

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