defmodule Alchemify.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{status: status, result: result}
  end

  def not_found_user do
    build(:not_found, "User not found")
  end
end
