defmodule Calculator.Process do
  @enforce_keys [:pid]
  defstruct [:pid]

  def new(pid) do
    %__MODULE__{
      pid: pid
    }
  end
end
