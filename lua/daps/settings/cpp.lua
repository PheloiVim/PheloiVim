require("dap").configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      local fileName = vim.fn.expand "%:t:r"
      os.execute("mkdir -p " .. "debug")
      vim.cmd("!clang++ -g % -o debug/" .. fileName)
      return "${fileDirname}/bin/" .. fileName
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
}
