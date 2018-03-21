defmodule Calculator.Process do
  @moduledoc """
  This type is used to ensure that only PIDs created by a `Calculator.start` can be passed into
  a calculator. That ensures the calculator process can only talk to ones it can do stuff with.
  """
 
  @enforce_keys [:pid]
  defstruct @enforce_keys

  def new(pid) do
    %__MODULE__{
      pid: pid
    }
  end
end
