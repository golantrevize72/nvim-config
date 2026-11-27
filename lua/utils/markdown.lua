local M = {}

function M.is_in_yaml_header()
  if vim.bo.filetype ~= 'markdown' then
    return false
  end

  local ok, node = pcall(vim.treesitter.get_node)
  if not ok or not node then
    return false
  end

  local current = node
  while current do
    local current_type = current:type()
    if current_type == 'frontmatter' or current_type == 'yaml_block' or current_type == 'minus_metadata' or current_type == 'plus_metadata' then
      return true
    end

    current = current:parent()
  end

  return false
end

return M
