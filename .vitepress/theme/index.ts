import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import BlogList from './components/BlogList.vue'
import HomeContent from './components/HomeContent.vue'
import AboutContent from './components/AboutContent.vue'
import Layout from './components/Layout.vue'
import './custom.css'
import { enhanceAppWithTabs } from 'vitepress-plugin-tabs/client'


export default {
  extends: DefaultTheme,
  Layout,
  enhanceApp({ app }) {
    app.component('BlogList', BlogList)
    app.component('HomeContent', HomeContent)
    app.component('AboutContent', AboutContent)
    enhanceAppWithTabs(app)
  },
} satisfies Theme
