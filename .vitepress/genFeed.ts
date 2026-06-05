import path from 'path'
import { writeFileSync } from 'fs'
import { Feed } from 'feed'
import { createContentLoader, type SiteConfig } from 'vitepress'

const siteUrl = 'https://wanaku.ai'

export async function genFeed(config: SiteConfig) {
  const feed = new Feed({
    title: 'Wanaku Blog',
    description: 'News and updates from the Wanaku project',
    id: siteUrl,
    link: siteUrl,
    language: 'en',
    copyright: 'Copyright Wanaku contributors',
  })

  const posts = await createContentLoader('blog/posts/*.md', {
    excerpt: true,
    render: true,
  }).load()

  posts.sort(
    (a, b) =>
      +new Date(b.frontmatter.date as string) -
      +new Date(a.frontmatter.date as string)
  )

  for (const { url, frontmatter, html } of posts) {
    feed.addItem({
      title: frontmatter.title as string,
      id: `${siteUrl}${url}`,
      link: `${siteUrl}${url}`,
      description: frontmatter.description as string,
      content: html,
      date: new Date(frontmatter.date as string),
      author: [{ name: (frontmatter.author as string) || 'Wanaku Team' }],
    })
  }

  writeFileSync(path.join(config.outDir, 'feed.xml'), feed.rss2())
  writeFileSync(path.join(config.outDir, 'feed.atom'), feed.atom1())
}
