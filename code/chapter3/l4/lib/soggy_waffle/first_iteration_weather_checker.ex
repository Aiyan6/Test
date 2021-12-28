#---
# Excerpted from "Testing Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lmelixir for more book information.
#---
defmodule SoggyWaffle.WeatherChecker do
  use GenServer
  
  #file path -> example/lib/soggy_waffle/weather_checker_with_mode.ex
#add this code at the indicated place mentioned in comments of example/lib/soggy_waffle/weather_checker_with_mode.ex
#in the playground widget

  @twilio_module Application.get_env(:soggy_waffle, :twilio_module) 
  
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @impl GenServer
  def init(opts) do
    mode = Keyword.get(opts, :mode, :periodic)
    interval = Keyword.fetch!(opts, :interval)

    state = %{
      city: Keyword.fetch!(opts, :city),
      phone_number: Keyword.fetch!(opts, :phone_number),
    }

    case mode do
      :periodic ->
        :timer.send_interval(interval, self(), :tick)

      :manual ->
        :ok
    end

    {:ok, state}
  end

  @impl GenServer
  def handle_info(:tick, state) do 
    # TODO: figure out how to actually use the weather API.
    if SoggyWaffle.rain?(state.city, DateTime.utc_now()) do
      @twilio_module.send_sms(state.phone_number, "It's going to rain")
    end
    {:noreply, state}
  end
end
