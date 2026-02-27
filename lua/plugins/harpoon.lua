return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = function()
    local keys = {}
    for i = 1, 9 do
      table.insert(keys, {
        "<C-" .. i .. ">",
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i .. " (ctrl)",
      })
    end
    return keys
  end,
}
