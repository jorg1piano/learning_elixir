defmodule Tuples do
  def reading_elements_from_tuple do
    person = {"Alice", 30, "Engineer"}

    # "Alice"
    name = elem(person, 0)

    # 30 (0 based indexing)
    age = elem(person, 1)

    # "Engineer"
    profession = elem(person, 2)

    # evaulates to true
    {name, age, profession} == person
  end

  def modifying_tuple do
    person = {"Alice", 30, "Engineer"}

    # we can use put_elem to create a new tuple with the modified value
    updated_person = put_elem(person, 1, 31)

    # {"Alice", 31, "Engineer"}
    updated_person
  end
end
