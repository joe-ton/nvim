local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensured_installed = {
                "gopls",
            },
        },
    },
}
return plugins
