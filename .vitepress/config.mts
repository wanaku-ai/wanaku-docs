import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Wanaku MCP Router Documentation",
  description: "Documentation for the Wanaku MCP Router",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Demos', link: 'https://github.com/wanaku-ai/wanaku-demos/' }
    ],

    sidebar: [
      {
        text: 'Wanaku Book',
        items: [
          { text: 'Architecture', link: `./architecture` },
          { text: 'Building', link: `./Building` },
          { text: 'Contributing', link: `./contributing` },
          { text: 'Usage', link: `./usage` },
          { text: 'Wanaku Internals', link: `./wanaku-router-internals` }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/wanaku-ai/' }
    ]
  }
})
