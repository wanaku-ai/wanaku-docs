<template>
  <div class="about-content">
    <section class="tech-section">
      <div class="container">
        <h2>Built on Proven Technology</h2>
        <p>
          Wanaku is built on the
          <a href="https://modelcontextprotocol.io/">Model Context Protocol (MCP)</a>,
          an emerging standard for linking LLMs to external data. It leverages proven integration technology:
        </p>
        <div class="tech-logos">
          <a href="https://modelcontextprotocol.io/" class="tech-logo">
            <img src="/images/mcp.png" alt="Model Context Protocol" />
            <span>MCP</span>
            <small>Standardized AI tool integration</small>
          </a>
          <a href="https://camel.apache.org/" class="tech-logo">
            <img src="/images/camel.png" alt="Apache Camel" />
            <span>Apache Camel</span>
            <small>300+ enterprise integration components</small>
          </a>
          <a href="https://quarkus.io/" class="tech-logo">
            <img src="/images/quarkus.png" alt="Quarkus" />
            <span>Quarkus</span>
            <small>Cloud-native Java framework</small>
          </a>
        </div>
      </div>
    </section>

    <section class="cta-section">
      <div class="container">
        <h2>Get Involved</h2>
        <p>Wanaku is developed by the community, for the community.</p>
        <div class="cta-links">
          <a href="https://github.com/wanaku-ai/wanaku" class="cta-button">GitHub</a>
          <a href="/community/" class="cta-button alt">Community</a>
          <a href="mailto:contact@wanaku.ai" class="cta-button alt">Contact Us</a>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.about-content {
  max-width: 1152px;
  margin: 0 auto;
  padding: 0 24px;
}

.container {
  text-align: center;
  padding: 48px 0;
}

.tech-section {
  border-top: 1px solid var(--vp-c-divider);
}

.tech-section h2,
.cta-section h2 {
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 16px;
  color: var(--vp-c-text-1);
}

.tech-section p {
  font-size: 1.1rem;
  color: var(--vp-c-text-2);
  max-width: 640px;
  margin: 0 auto 32px;
  line-height: 1.7;
}

.tech-section p a {
  color: var(--vp-c-brand-1);
  text-decoration: none;
}

.tech-section p a:hover {
  text-decoration: underline;
}

.tech-logos {
  display: flex;
  justify-content: center;
  gap: 48px;
  flex-wrap: wrap;
}

.tech-logo {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  text-decoration: none;
  transition: transform 0.2s;
}

.tech-logo:hover {
  transform: translateY(-4px);
}

.tech-logo img {
  width: 80px;
  height: 80px;
  object-fit: contain;
}

.tech-logo span {
  font-weight: 600;
  color: var(--vp-c-text-1);
}

.tech-logo small {
  font-size: 0.85rem;
  color: var(--vp-c-text-3);
}

.cta-section {
  border-top: 1px solid var(--vp-c-divider);
}

.cta-section p {
  font-size: 1.1rem;
  color: var(--vp-c-text-2);
  margin-bottom: 24px;
}

.cta-links {
  display: flex;
  justify-content: center;
  gap: 12px;
  flex-wrap: wrap;
}

.cta-button {
  display: inline-block;
  padding: 12px 32px;
  background-color: var(--vp-c-brand-1);
  color: var(--vp-c-white);
  border-radius: 20px;
  font-weight: 600;
  text-decoration: none;
  transition: background-color 0.25s;
}

.cta-button:hover {
  background-color: var(--vp-c-brand-2);
}

.cta-button.alt {
  background-color: var(--vp-c-bg-soft);
  color: var(--vp-c-text-1);
  border: 1px solid var(--vp-c-divider);
}

.cta-button.alt:hover {
  border-color: var(--vp-c-brand-1);
  color: var(--vp-c-brand-1);
}
</style>
