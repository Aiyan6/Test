defmodule TestingEcto.SchemaCase do

#file path -> testing_ecto/test/schema_case.ex
#add this code at the indicated place mentioned in comments of testing_ecto/test/schema_case.ex
#in the playground widget
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ecto.Changeset
      import TestingEcto.SchemaCase
    end
  end


#file path -> testing_ecto/test/schema_case.ex
#add this code at the indicated place mentioned in comments of testing_ecto/test/schema_case.ex
#in the playground widget  
  def valid_params(fields_with_types) do
    valid_value_by_type = %{
      date: fn -> to_string(Faker.Date.date_of_birth()) end,
      float: fn -> :rand.uniform() * 10 end,
      string: fn -> Faker.Lorem.word() end,
      utc_datetime_usec: fn -> DateTime.utc_now() end,
      binary_id: fn -> Ecto.UUID.generate() end
    }

    for {field, type} <- fields_with_types, into: %{} do
      {Atom.to_string(field), valid_value_by_type[type].()}
    end
  end

  def invalid_params(fields_with_types) do
    invalid_value_by_type = %{
      date: fn -> Faker.Lorem.word() end,
      float: fn -> Faker.Lorem.word() end,
      string: fn -> DateTime.utc_now() end,
      utc_datetime_usec: fn -> Faker.Lorem.word() end,
      binary_id: fn -> 1 end
    }

    for {field, type} <- fields_with_types, into: %{} do
      {Atom.to_string(field), invalid_value_by_type[type].()}
    end
  end



end
