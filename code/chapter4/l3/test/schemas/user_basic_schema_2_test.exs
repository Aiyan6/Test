defmodule TestingEcto.Schemas.UserBasicSchema2Test do
  use ExUnit.Case

#file path -> testing_ecto/test/schemas/user_basic_schema_1_test.exs
#add this code at the indicated place mentioned in comments of testing_ecto/test/schemas/user_basic_schema_1_test.exs
#in the playground widget
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



end  