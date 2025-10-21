import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
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
  }
})
