defmodule Calculator do
  @moduledoc """
  A simple calculator that runs asynchronus operations, and returns a total when asked for it.
  """

  @doc """
  Spawns a calculator process which waits for commands. Returns the PID of that process, and
  initialises the calculator with a state of initial_value, or 0 if no initial_value is given,
  """
  def start(initial_value \\ 0) do
    Calculator.Process.new(spawn(fn -> loop(initial_value) end))
  end

  @doc """
  Makes a synchronus, blocking, request for the current state of the given calculator process.
  """
  def value(%Calculator.Process{pid: pid}) do
    send(pid, {:value, self()})

    receive do
      {:response, value} -> value
    end
  end

  @doc """
  Sends a message to the process kicked off by `start/1 to add a given number to the value contained
  within it. Returns the process so it can be piped into another calculator operation.
  """
  def add(process = %Calculator.Process{pid: pid}, value) do
    send(pid, {:add, value})
    process
  end

  @doc """
  Sends a message to the process kicked off by `start/1 to subtract a given number to the value contained
  within it. Returns the process so it can be piped into another calculator operation.
  """
  def subtract(process = %Calculator.Process{pid: pid}, value) do
    send(pid, {:subtract, value})
    process
  end

  @doc """
  Sends a message to the process kicked off by `start/1 to divide a given number to the value contained
  within it. Returns the process so it can be piped into another calculator operation.
  """
  def divide(process = %Calculator.Process{pid: pid}, value) do
    send(pid, {:divide, value})
    process
  end

  @doc """
  Sends a message to the process kicked off by `start/1 to multiply a given number to the value contained
  within it. Returns the process so it can be piped into another calculator operation.
  """
  def multiply(process = %Calculator.Process{pid: pid}, value) do
    send(pid, {:multiply, value})
    process
  end

  defp loop(current_value) do
    new_value =
      receive do
        message -> process_message(message, current_value)
      end

    loop(new_value)
  end

  defp process_message({:value, caller}, current_value) do
    send(caller, {:response, current_value})
    current_value
  end

  defp process_message({:add, value}, current_value), do: current_value + value
  defp process_message({:subtract, value}, current_value), do: current_value - value
  defp process_message({:divide, value}, current_value), do: current_value / value
  defp process_message({:multiply, value}, current_value), do: current_value * value

  defp process_message(_, current_value) do
    IO.puts("I'm sorry Dave I'm afraid I cant do that...")
    current_value
  end
end
