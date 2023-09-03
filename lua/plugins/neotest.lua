return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
    "Issafalcon/neotest-dotnet",
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {},
      ["neotest-dotnet"] = {},
    },
  },
}
