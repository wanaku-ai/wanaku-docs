<script setup lang="ts">
import { ref, computed } from 'vue'
import { data as posts } from '../../../blog/posts.data'

const selectedTag = ref('')
const page = ref(1)
const perPage = 10

const allTags = computed(() => {
  const tags = new Set<string>()
  posts.forEach(p => p.tags.forEach(t => tags.add(t)))
  return Array.from(tags).sort()
})

const filtered = computed(() => {
  if (!selectedTag.value) return posts
  return posts.filter(p => p.tags.includes(selectedTag.value))
})

const paginated = computed(() => {
  const start = (page.value - 1) * perPage
  return filtered.value.slice(start, start + perPage)
})

const totalPages = computed(() => Math.ceil(filtered.value.length / perPage))

function selectTag(tag: string) {
  selectedTag.value = tag
  page.value = 1
}
</script>

<template>
  <div class="blog-list">
    <h1>Blog</h1>

    <div class="tags" v-if="allTags.length > 0">
      <button
        class="tag-btn"
        :class="{ active: !selectedTag }"
        @click="selectTag('')"
      >All</button>
      <button
        v-for="tag in allTags"
        :key="tag"
        class="tag-btn"
        :class="{ active: selectedTag === tag }"
        @click="selectTag(tag)"
      >{{ tag }}</button>
    </div>

    <div v-if="paginated.length === 0" class="no-posts">
      <p>No posts yet. Stay tuned!</p>
    </div>

    <article v-for="post in paginated" :key="post.url" class="post-card">
      <h2><a :href="post.url">{{ post.title }}</a></h2>
      <div class="meta">
        <span class="date">{{ post.date.string }}</span>
        <span class="author"> &middot; {{ post.author }}</span>
      </div>
      <p class="description">{{ post.description }}</p>
      <div class="post-tags">
        <span
          v-for="tag in post.tags"
          :key="tag"
          class="tag"
          @click="selectTag(tag)"
        >{{ tag }}</span>
      </div>
    </article>

    <div class="pagination" v-if="totalPages > 1">
      <button :disabled="page <= 1" @click="page--">Previous</button>
      <span>{{ page }} / {{ totalPages }}</span>
      <button :disabled="page >= totalPages" @click="page++">Next</button>
    </div>
  </div>
</template>

<style scoped>
.blog-list {
  max-width: 720px;
  margin: 0 auto;
  padding: 24px;
}

.blog-list h1 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 24px;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 32px;
}

.tag-btn {
  padding: 6px 16px;
  border: 1px solid var(--vp-c-divider);
  border-radius: 20px;
  background: transparent;
  color: var(--vp-c-text-2);
  cursor: pointer;
  font-size: 0.9rem;
  transition: all 0.2s;
}

.tag-btn:hover,
.tag-btn.active {
  background-color: var(--vp-c-brand-1);
  color: var(--vp-c-white);
  border-color: var(--vp-c-brand-1);
}

.post-card {
  padding: 24px 0;
  border-bottom: 1px solid var(--vp-c-divider);
}

.post-card h2 {
  margin: 0 0 8px;
  font-size: 1.3rem;
}

.post-card h2 a {
  color: var(--vp-c-text-1);
  text-decoration: none;
}

.post-card h2 a:hover {
  color: var(--vp-c-brand-1);
}

.meta {
  font-size: 0.9rem;
  color: var(--vp-c-text-3);
  margin-bottom: 8px;
}

.description {
  color: var(--vp-c-text-2);
  line-height: 1.6;
}

.post-tags {
  display: flex;
  gap: 6px;
  margin-top: 8px;
}

.tag {
  font-size: 0.8rem;
  padding: 2px 10px;
  border-radius: 12px;
  background: var(--vp-c-bg-soft);
  color: var(--vp-c-text-2);
  cursor: pointer;
}

.tag:hover {
  background: var(--vp-c-brand-soft);
  color: var(--vp-c-brand-1);
}

.no-posts {
  text-align: center;
  padding: 48px 0;
  color: var(--vp-c-text-3);
}

.pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
  padding: 24px 0;
}

.pagination button {
  padding: 8px 20px;
  border: 1px solid var(--vp-c-divider);
  border-radius: 8px;
  background: transparent;
  color: var(--vp-c-text-1);
  cursor: pointer;
}

.pagination button:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}

.pagination button:not(:disabled):hover {
  border-color: var(--vp-c-brand-1);
  color: var(--vp-c-brand-1);
}
</style>
