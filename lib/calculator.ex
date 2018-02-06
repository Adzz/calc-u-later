defmodule Calculator do
  @moduledoc """
  """

  @doc """

  """
  def start do
    spawn(fn -> loop(0) end)
  end

  def value(server_pid) do
    send(server_pid, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  def add(server_pid, value), do: send(server_pid, {:add, value})

  defp loop(current_value) do
    new_value = receive do
      {:value, caller} ->
        send(caller, {:response, current_value})
        current_value

      {:add, value} -> current_value + value

      invalid_request ->
        IO.puts "I'm sorry Dave I'm afraid I cant do that..."
        current_value
    end

    loop(new_value)
  end
end
