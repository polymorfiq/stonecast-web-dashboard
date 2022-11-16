defmodule Stonecast.Device do
  @moduledoc """
  Represents a Stonecast Device that has been communicated with.

  Having a Device not indicate that the device is online or within range - it contains the latest possible information on the state of the device.
  """
  use GenServer

  def start_link(id) do
    GenServer.start_link(__MODULE__, id)
  end

  @doc ~S"""
  Returns the ID of the given Device

  ## Example
      iex> {:ok, dvc} = Stonecast.Device.start_link("abc")
      iex> Stonecast.Device.id(dvc)
      "abc"
  """
  def id(pid), do: GenServer.call(pid, :id)

  @doc ~S"""
  Returns the name of the given Device or nil if none has been seen

  ## Examples
      iex> {:ok, dvc} = Stonecast.Device.start_link("abc")
      iex> Stonecast.Device.set_info(dvc, :name, "Jumanji")
      iex> Stonecast.Device.name(dvc)
      "Jumanji"

      iex> {:ok, dvc} = Stonecast.Device.start_link("abc")
      iex> Stonecast.Device.name(dvc)
      nil
  """
  def name(pid), do: GenServer.call(pid, :name)


  @doc ~S"""
  Allows external services to record metadata seen for a given Device

  ## Examples
      iex> {:ok, dvc} = Stonecast.Device.start_link("abc")
      iex> Stonecast.Device.name(dvc)
      nil
      iex> Stonecast.Device.set_info(dvc, :name, "Jumanji")
      iex> Stonecast.Device.name(dvc)
      "Jumanji"
  """
  def set_info(pid, :name, name) do
    GenServer.cast(pid, {:set_info, :name, name})
  end

  @impl true
  def init(id) do
    {:ok, %{
      id: id,
      name: nil
    }}
  end

  @impl true
  def handle_call(:id, _from, %{id: id} = state) do
    {:reply, id, state}
  end

  @impl true
  def handle_call(:name, _from, %{name: name} = state) do
    {:reply, name, state}
  end

  @impl true
  def handle_cast({:set_info, :name, name}, state) do
    {:noreply, %{state | name: name}}
  end

end
