import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import { inBrowser } from 'vitepress'
import BlogList from './components/BlogList.vue'
import HomeContent from './components/HomeContent.vue'
import AboutContent from './components/AboutContent.vue'
import Layout from './components/Layout.vue'
import './custom.css'
import { enhanceAppWithTabs } from 'vitepress-plugin-tabs/client'

async function renderMermaid() {
  if (!inBrowser) return
  const els = document.querySelectorAll('pre.mermaid')
  if (els.length === 0) return
  const { default: mermaid } = await import('mermaid')
  mermaid.initialize({ startOnLoad: false, securityLevel: 'loose' })
  await mermaid.run({ nodes: els as NodeListOf<HTMLElement> })
}

export default {
  extends: DefaultTheme,
  Layout,
  enhanceApp({ app, router }) {
    app.component('BlogList', BlogList)
    app.component('HomeContent', HomeContent)
    app.component('AboutContent', AboutContent)
    enhanceAppWithTabs(app)

    if (inBrowser) {
      router.onAfterRouteChanged = () => { renderMermaid() }
    }
  },
} satisfies Theme
