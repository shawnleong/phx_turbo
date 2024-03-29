defmodule TurboWeb.Live1 do
  use TurboWeb, :live_view

  alias TurboWeb.LinkComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~H"""
    <h1>LiveView 1</h1>
    <label>This implements via incrementing/decrementing the assign</label>

    <h2><%= @count %></h2>

    <button phx-click="inc">+</button>
    <button phx-click="dec">-</button>

    <LinkComponent.render socket={@socket} />
    """
  end

  def handle_event("inc", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count - 1)}
  end
end
