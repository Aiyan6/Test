defmodule NotSkull.Schema do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import NotSkull.Schema
      import Ecto.Changeset

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
      @timestamps_opts type: :utc_datetime_usec
    end
  end

  defmacro is_uuid(value) do
    quote do
      is_binary(unquote(value)) and byte_size(unquote(value)) == 36 and
        binary_part(unquote(value), 8, 1) == "-" and binary_part(unquote(value), 13, 1) == "-" and
        binary_part(unquote(value), 18, 1) == "-" and binary_part(unquote(value), 23, 1) == "-"
    end
  end

end
