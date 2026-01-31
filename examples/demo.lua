-- OrangeVim Theme Demo
-- This file showcases various syntax highlighting features

--- @class User
--- @field name string User's name
--- @field age number User's age
local User = {}

-- Constants and numbers
local MAX_RETRIES = 3
local PI = 3.14159
local IS_ACTIVE = true

-- Strings and escape sequences
local greeting = "Hello, World!"
local multiline = [[
  This is a multiline
  string with \n escapes
]]

--- Creates a new user
--- @param name string
--- @param age number
--- @return User
function User:new(name, age)
  local instance = setmetatable({}, { __index = User })
  instance.name = name
  instance.age = age
  return instance
end

-- Conditionals and loops
function User:greet()
  if self.age >= 18 then
    print("Hello, " .. self.name .. "!")
  else
    print("Hi, " .. self.name .. "!")
  end

  -- Loop example
  for i = 1, 10 do
    if i % 2 == 0 then
      print(i .. " is even")
    else
      print(i .. " is odd")
    end
  end
end

-- Error handling
local function risky_operation()
  local success, result = pcall(function()
    error("Something went wrong!")
  end)

  if not success then
    print("Error: " .. tostring(result))
  end
end

-- Table operations
local users = {
  User:new("Alice", 25),
  User:new("Bob", 30),
  User:new("Charlie", 17),
}

-- Functional programming
local filtered = vim.tbl_filter(function(user)
  return user.age >= 18
end, users)

-- Vim API calls
vim.api.nvim_set_keymap('n', '<leader>t', ':echo "Test"<CR>', {
  noremap = true,
  silent = true,
  desc = "Test mapping"
})

-- TODO: Add more features
-- FIXME: Fix the bug in the login system
-- WARN: This function is deprecated
-- NOTE: Remember to update documentation
-- HACK: Temporary workaround
-- PERF: Optimize this later

-- Special characters and operators
local result = (10 + 20) * 2 - 5 / 2
local comparison = result >= 50 and result <= 100 or false

-- Built-in functions
print(string.format("Result: %d", result))
table.insert(users, User:new("Diana", 28))

return User
