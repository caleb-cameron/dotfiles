local attach_to_buffer = function(output_buf, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("kleebGoBuildOnWrite", {clear = true}),
        pattern = pattern,
        callback = function()
            local append_data = function(_, data)
                    if data then
                        vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, data)
                    end
            end

            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data
            })
        end,
    })
end

vim.api.nvim_create_user_command("KRun", function()
    print "KRun starting..."
    local bufnr = nvim_get_current_buf()
    local command = "go run"
    local pattern = vim.fn.input("pattern: ")

    command = vim.split(command, " ")

    attach_to_buffer(bufnr, pattern, command)
end, {})
