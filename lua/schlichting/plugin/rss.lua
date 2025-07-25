return {
    "neo451/feed.nvim",
    cmd = "Feed",
    ---@module 'feed'
    ---@type feed.config
    opts = {
        feeds = {
            news = {
                tech = {
                    { "https://neovim.io/news.xml", name = "Neovim News" },
                },
                cyber_security = {
                    { "https://www.bsi.bund.de/SiteGlobals/Functions/RSSFeed/RSSNewsfeed/RSSNewsfeed_CSW.xml", name = "BSI IT Sicherheitsmitteilungen" },
                    { "https://www.heise.de/security/feed.xml", name = "Heise Security" },
                },
            },
            release_notes = {
                { "neovim/neovim/releases", name = "Neovim Releases"},
            },
        },
    },
}
