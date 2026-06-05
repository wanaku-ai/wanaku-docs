import { createContentLoader } from 'vitepress'

export interface Post {
  title: string
  url: string
  date: { string: string; time: number }
  tags: string[]
  description: string
  author: string
}

declare const data: Post[]
export { data }

export default createContentLoader('blog/posts/*.md', {
  transform(raw): Post[] {
    return raw
      .map(({ url, frontmatter }) => ({
        title: frontmatter.title,
        url,
        date: formatDate(frontmatter.date),
        tags: frontmatter.tags || [],
        description: frontmatter.description || '',
        author: frontmatter.author || 'Wanaku Team',
      }))
      .sort((a, b) => b.date.time - a.date.time)
  },
})

function formatDate(raw: string): Post['date'] {
  const date = new Date(raw)
  return {
    time: +date,
    string: date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
    }),
  }
}
