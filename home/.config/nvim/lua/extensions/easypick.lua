local easypick = require("easypick")

-- Local function to get the base branch
local function base_branch()
  local get_default_branch = "git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
  local b = vim.fn.system(get_default_branch)

  if b == "" then
    b = "main"
  end

  return b
end

easypick.setup({
  pickers = {
    -- diff current branch with base_branch and show files that changed with respective diffs in preview
    {
      name = "changed_files",
      command = "git diff --name-only $( git merge-base HEAD " .. base_branch() .. " )",
      previewer = easypick.previewers.branch_diff({ base_branch = base_branch() })
    },
  }
})
