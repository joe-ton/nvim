vim.api.nvim_create_user_command("GoTags", function()
  local filename = vim.fn.expand("%:p")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local struct_names = {}

  for _, line in ipairs(lines) do
    local name = line:match("^%s*type%s+(%w+)%s+struct%s*{")
    if name then
      table.insert(struct_names, name)
    end
  end

  if #struct_names == 0 then
    vim.notify("No structs found in file", vim.log.levels.WARN)
    return
  end

  for _, struct in ipairs(struct_names) do
    local cmd = string.format(
      "gomodifytags -file %s -struct %s -add-tags json -transform snakecase -w",
      filename, struct
    )
    vim.fn.system(cmd)
  end

  vim.cmd("edit!") -- reload file
  vim.notify("Added JSON tags to " .. #struct_names .. " struct(s)")
end, { desc = "Add JSON tags to all structs in file" })

