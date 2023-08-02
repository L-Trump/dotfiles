return function ()
    -- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    --     pattern = opts.patterns,
    --     callback = function()
    --       vim.cmd [[VimtexCompile]]
    --     end,
    -- })
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_quickfix_mod = 0
    -- vim.g.vimtex_view_general_viewer = 'okular'
    -- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-xelatex'
    }
    vim.g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
            "-shell-escape",
            "-verbose",
            "-file-line-error",
            "-synctex=1",
            "-interaction=nonstopmode",
        },
    }
    vim.g.tex_comment_nospell = 1
    vim.g.vimtex_compiler_progname = 'nvr'

    vim.cmd([[
        augroup vimtex
            autocmd!
            autocmd User VimtexEventView call b:vimtex.viewer.xdo_focus_vim()
        augroup END
    ]])
end
