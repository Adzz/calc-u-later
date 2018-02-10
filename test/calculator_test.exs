defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "initializes with 0 value" do
    assert Calculator.start() |> Calculator.equals() == 0
  end

  test "add/2 adds the initial value to the given value" do
    result =
      Calculator.start()
      |> Calculator.add(10)
      |> Calculator.equals()

    assert result == 10
  end

  test "subtract/2 adds the initial value to the given value" do
    result =
      Calculator.start(10)
      |> Calculator.subtract(5)
      |> Calculator.equals()

    assert result == 5
  end

  test "divide/2 adds the initial value to the given value" do
    result =
      Calculator.start(10)
      |> Calculator.divide(2)
      |> Calculator.equals()

    assert result == 5.0
  end

  test "multiply/2 adds the initial value to the given value" do
    result =
      Calculator.start(10)
      |> Calculator.multiply(2)
      |> Calculator.equals()

    assert result == 20
  end

  test "piping operations works as expected" do
    result =
      Calculator.start(10)
      |> Calculator.subtract(5)
      |> Calculator.add(400)
      |> Calculator.equals()

    assert result == 405
  end
end
