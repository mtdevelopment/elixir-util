defmodule OMTT.Util.Changeset do
  import Ecto.Changeset, only: [update_change: 3]

  def lowercase_field(changeset, fieldname) when is_atom(fieldname) do
    update_change(changeset, fieldname, &String.downcase/1)
  end
end
