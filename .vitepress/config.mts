import { defineConfig } from 'vitepress'
import { withMermaid } from "vitepress-plugin-mermaid";

// https://vitepress.dev/reference/site-config + mermaid
export default withMermaid({
    title: "Wanaku MCP Router Documentation",
    description: "Documentation for the Wanaku MCP Router",
    ignoreDeadLinks: true,
    base: '/docs',
    outDir: 'docs',
    themeConfig: {
        // https://vitepress.dev/reference/default-theme-config
        nav: [
            { text: 'Home', link: 'http://www.wanaku.ai' },
            { text: 'Documentation', link: '/' }
        ],

        socialLinks: [
            { icon: 'github', link: 'https://github.com/wanaku-ai/' }
        ],
        docFooter: {
            prev: false,
            next: false,
        },
    },

    // your existing vitepress config...
    // optionally, you can pass MermaidConfig
    mermaid: {
        // refer https://mermaid.js.org/config/setup/modules/mermaidAPI.html#mermaidapi-configuration-defaults for options
    },
    // optionally set additional config for plugin itself with MermaidPluginConfig
    mermaidPlugin: {
        class: "mermaid my-class", // set additional css classes for parent container
    },
});
