ExUnit.start

Mix.Task.run "ecto.create", ~w(-r GuardianOfGalaxy.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r GuardianOfGalaxy.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(GuardianOfGalaxy.Repo)

