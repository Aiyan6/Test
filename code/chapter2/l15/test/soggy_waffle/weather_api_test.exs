defmodule SoggyWaffle.WeatherAPITest do
  use ExUnit.Case

#file path -> soggy_waffle/test/soggy_waffle/weather_api_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle/weather_api_test.exs
#in the playground widget
  setup do
    bypass = Bypass.open(port: 4040) 
    {:ok, bypass: bypass}
  end

#file path -> soggy_waffle/test/soggy_waffle/weather_api_test.exs
#add this code at the indicated place mentioned in comments of soggy_waffle/test/soggy_waffle/weather_api_test.exs
#in the playground widget
  

  test "get_forecast/1 hits GET /data/2.5/forecast", %{bypass: bypass} do
    query = "Los Angeles"
    app_id = "none"
    test_server_url = "http://localhost:4040"
    
    forecast_data = %{
      "list" => [
        %{
          "dt" => DateTime.to_unix(DateTime.utc_now()) +  60,
          "weather" => [%{"id" => _thunderstorm = 231}]
        }
      ]
    }

    Bypass.expect_once(bypass, "GET", "/data/2.5/forecast", fn conn ->
      conn = Plug.Conn.fetch_query_params(conn)

      assert conn.query_params["q"] == query
      assert conn.query_params["APPID"] == app_id

      conn
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Plug.Conn.resp(200, Jason.encode!(forecast_data))
    end)

    assert {:ok, body} =
             SoggyWaffle.WeatherAPI.get_forecast(
               "Los Angeles",
               test_server_url
             )

    assert body == forecast_data
  end


end