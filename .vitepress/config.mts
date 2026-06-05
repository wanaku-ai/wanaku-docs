import { defineConfig } from 'vitepress'
import { withMermaid } from "vitepress-plugin-mermaid";
import { genFeed } from './genFeed'

// https://vitepress.dev/reference/site-config + mermaid
export default withMermaid({
    title: "Wanaku",
    description: "The first open-source MCP Router for AI workflows",
    ignoreDeadLinks: true,
    base: '/',
    outDir: 'dist',
    srcExclude: ['**/node_modules/**', 'camel-integration-capability/main/**'],
    themeConfig: {
        // https://vitepress.dev/reference/default-theme-config
        nav: [
            { text: 'Home', link: '/' },
            { text: 'Documentation', link: '/docs/' },
            { text: 'Blog', link: '/blog/' },
            { text: 'Community', link: '/community/' },
            { text: 'About', link: '/about/' },
        ],

        socialLinks: [
            { icon: 'github', link: 'https://github.com/wanaku-ai/' },
            { icon: 'youtube', link: 'https://www.youtube.com/@WanakuAI' },
        ],
        docFooter: {
            prev: false,
            next: false,
        },
    },

    async buildEnd(siteConfig) {
        await genFeed(siteConfig)
    },

    // optionally, you can pass MermaidConfig
    mermaid: {
        // refer https://mermaid.js.org/config/setup/modules/mermaidAPI.html#mermaidapi-configuration-defaults for options
    },
    // optionally set additional config for plugin itself with MermaidPluginConfig
    mermaidPlugin: {
        class: "mermaid my-class", // set additional css classes for parent container
    },
});
