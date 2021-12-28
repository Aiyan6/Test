defmodule TestingEcto.Schemas.UserBasicSchema2Test do
  use ExUnit.Case
  alias Ecto.Changeset
  alias TestingEcto.Schemas.UserBasicSchema

  @expected_fields_with_types [
    {:date_of_birth, :date},
    {:email, :string},
    {:favorite_number, :float},
    {:first_name, :string},
    {:last_name, :string},
    {:phone_number, :string}
  ]
  describe "fields and types" do   
    @tag :schema_definition  
    test "it has the correct fields and types" do
      actual_fields_with_types =
        for field <- UserBasicSchema.__schema__(:fields) do 
          type = UserBasicSchema.__schema__(:type, field) 
          {field, type}
        end

      assert MapSet.new(actual_fields_with_types) ==
               MapSet.new(@expected_fields_with_types)
    end
  end
  
#file path -> testing_ecto/test/schemas/user_basic_schema_1_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/schemas/user_basic_schema_1_test.exs
#in the playground widget
describe "changeset/1" do
  test "success: returns a valid changeset when given valid arguments" do
    valid_params = valid_params(@expected_fields_with_types)

    changeset = UserBasicSchema.changeset(valid_params)
    assert %Changeset{valid?: true, changes: changes} = changeset

    mutated = [:date_of_birth]

    for {field, _} <- @expected_fields_with_types, field not in mutated do
      actual = Map.get(changes, field)
      expected = valid_params[Atom.to_string(field)]
      assert actual == expected,
              "Values did not match for field: #{field}\nexpected: #{
                inspect(expected)
              }\nactual: #{inspect(actual)}"
    end

    expected_dob = Date.from_iso8601!(valid_params["date_of_birth"])
    assert changes.date_of_birth == expected_dob
  end

end

defp valid_params(fields_with_types) do
  valid_value_by_type = %{
    date: fn -> to_string(Faker.Date.date_of_birth()) end,
    float: fn -> :rand.uniform() * 10 end,
    string: fn -> Faker.Lorem.word() end
  }

  for {field, type} <- fields_with_types, into: %{} do
    {Atom.to_string(field), valid_value_by_type[type].()}
  end
end

end