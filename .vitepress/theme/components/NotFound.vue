<template>
  <div class="not-found">
    <h1>404</h1>
    <p>Page not found</p>
    <div class="links">
      <a href="/" class="link">Home</a>
      <a href="/docs/" class="link">Documentation</a>
    </div>
  </div>
</template>

<style scoped>
.not-found {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 60vh;
  text-align: center;
  padding: 2rem;
}

.not-found h1 {
  font-size: 4rem;
  font-weight: 700;
  margin: 0;
}

.not-found p {
  font-size: 1.25rem;
  color: var(--vp-c-text-2);
  margin: 0.5rem 0 1.5rem;
}

.links {
  display: flex;
  gap: 1rem;
}

.link {
  display: inline-block;
  padding: 0.5rem 1.25rem;
  border-radius: 6px;
  font-weight: 500;
  color: var(--vp-c-white);
  background-color: var(--vp-c-brand-1);
  transition: background-color 0.25s;
}

.link:hover {
  background-color: var(--vp-c-brand-2);
  text-decoration: none;
}
</style>
