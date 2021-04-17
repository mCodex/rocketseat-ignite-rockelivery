# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rockelivery.{Item, Order, Repo, User}

user = %User{
  age: 27,
  address: "Street 1",
  cep: "12345678",
  cpf: "12345678901",
  email: "user@user.com",
  name: "User"
}

%User{id: user_id} = Repo.insert!(user)

item1 = %Item{
  category: :food,
  description: "Food description",
  price: Decimal.new("45.50"),
  photo: "priv/photos/user.png"
}

item2 = %Item{
  category: :food,
  description: "Food description",
  price: Decimal.new("10.50"),
  photo: "priv/photos/user.png"
}

Repo.insert!(item1)

Repo.insert!(item2)

order = %Order{
  user_id: user_id,
  items: [item1, item1, item2],
  address: "Street 1",
  comments: "A beautiful description",
  payment_method: :money
}

Repo.insert!(order)
