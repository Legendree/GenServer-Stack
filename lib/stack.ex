defmodule Stack do
  @server Stack.Server

  def start_link(initial_state \\ []) do
    GenServer.start_link(@server, initial_state, name: @server)
  end

  def push(item) do
    GenServer.cast(@server, {:push, item})
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def format_status(_reason, [_pdict, state]) do
    [
      data: [
        {'State',
         "Stack is currently has the length of #{length(state)} and the items #{inspect(state)}"}
      ]
    ]
  end
end
