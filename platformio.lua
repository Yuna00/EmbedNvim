vim.keymap.set('n', '<leader>pc', vim.cmd.PIO)
vim.keymap.set('n', '<leader>pnp', vim.cmd.PIONewProject)
vim.keymap.set('n', '<leader>pap', vim.cmd.PIOAddLibrary)
vim.keymap.set('n', '<leader>prp', vim.cmd.PIORemoveLibrary)

local function upload_code_to_board()
    vim.fn.jobstart("platformio run -t upload", {
        on_exit = function(_, code)
            if code == 0 then
                print("Code uploaded successfully to the board!")
            else
                print("Error uploading code to the board!")
            end
        end
    })
end

vim.api.nvim_set_keymap('n', '<leader>pcu', ':lua upload_code_to_board()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>pcu', function()
	vim.fn.jobstart("platformio run -t upload", {
        on_exit = function(_, code)
            if code == 0 then
                print("Code uploaded successfully to the board!")
            else
                print("Error uploading code to the board!")
            end
        end
    })
end)


