defmodule Stonecast.Hub do
  @moduledoc """
  A centralized hub by which a group of Stonecast devices can be viewed, managed, and communicated with.
  """
  use GenServer
  alias Stonecast.Device

  def start_link, do: start_link([])
  def start_link(device_ids) when is_list(device_ids) do
    GenServer.start_link(__MODULE__, device_ids)
  end

  @doc ~S"""
  Adds a device to the Hub's list of devices, given a Device ID

  ## Example
      iex> {:ok, hub} = Stonecast.Hub.start_link
      iex> Stonecast.Hub.add_device(hub, "some-device-id")
      iex> Stonecast.Hub.devices(hub) |> Enum.count()
      1
  """
  def add_device(pid, device_id) do
    GenServer.cast(pid, {:add_device, device_id})
  end


  @doc ~S"""
  Lists devices that have been seen by the Hub

  ## Example
      iex> {:ok, hub} = Stonecast.Hub.start_link(["some-device-id"])
      iex> [device] = Stonecast.Hub.devices(hub)
      iex> Stonecast.Device.id(device)
      "some-device-id"
  """
  def devices(pid) do
    GenServer.call(pid, :devices)
  end

  @impl true
  def init(device_ids) do
    devices = Enum.map(device_ids, &get_device/1)
    {:ok, %{devices: devices}}
  end

  @impl true
  def handle_call(:devices, _from, %{devices: devices} = state) do
    {:reply, devices, state}
  end

  @impl true
  def handle_cast({:add_device, device_id}, %{devices: devices} = state) do
    {:noreply, %{state | devices: [get_device(device_id) | devices]}}
  end

  defp get_device(device_id) do
    {:ok, device} = Device.start_link(device_id)
    device
  end
end
