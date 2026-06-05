import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import BlogList from './components/BlogList.vue'
import HomeContent from './components/HomeContent.vue'
import AboutContent from './components/AboutContent.vue'
import './custom.css'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('BlogList', BlogList)
    app.component('HomeContent', HomeContent)
    app.component('AboutContent', AboutContent)
  },
} satisfies Theme
