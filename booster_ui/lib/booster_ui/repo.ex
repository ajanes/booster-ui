defmodule BoosterUi.Repo do
  use Ecto.Repo, otp_app: :booster_ui

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

  def generate_uuid() do
    Ecto.UUID.generate()
  end
end
