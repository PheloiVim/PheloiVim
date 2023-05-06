require("dap").adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "/home/chien/.local/share/nvim/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}
