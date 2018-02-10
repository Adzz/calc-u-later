# Calculator

This is a simple calculator written in elixir, leveraging erlang processess to asynchronusly run
operations.

Use it like this:

```elixir
Calculator.start |> Calculator.add(10) |> Calculator.equals
#=> 10

Calculator.start(10) |> Calculator.add(10) |> Calculator.equals
#=> 20

Calculator.start
|> Calculator.add(10)
|> Calculator.subtract(5)
|> Calculator.multiply(10)
|> Calculator.divide(2)
|> Calculator.equals

#=> 25.0
```

## Installation

Documentation can be generated with `$ mix docs`
And tests can be run with `mix test`
