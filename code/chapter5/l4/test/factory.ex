defmodule TestingEcto.Factory do
  use ExMachina.Ecto, repo: TestingEcto.Repo  
  alias TestingEcto.Schemas.User

  def user_factory do  
    %User{  
      date_of_birth: to_string(Faker.Date.date_of_birth()),
      email: Faker.Internet.email(),
      favorite_number: :rand.uniform() * 10,
      first_name: Faker.Name.first_name(),
      last_name: Faker.Name.last_name(),
      phone_number: Faker.Phone.EnUs.phone(),
    }
  end
end
