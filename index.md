---
layout: home

hero:
  name: "Wanaku"
  text: "The First Open-Source MCP Router"
  tagline: Meet Wanaku, the first open-source MCP Router that acts like a friendly, efficient receptionist for your digital office.
  image:
    src: /images/wanaku.png
    alt: Wanaku
  actions:
    - theme: brand
      text: Get Started
      link: /docs/demos/wanaku-demos-current/
    - theme: alt
      text: View on GitHub
      link: https://github.com/wanaku-ai/wanaku

features:
  - title: Eliminate Repetitive Configurations
    details: Automates agentic integrations spanning HTTP, Kafka, FTP, and additional protocols.
    icon: "⚙️"
  - title: Strengthen Security & Compliance
    details: Provides straightforward enforcement of access control, auditing, and error handling.
    icon: "🔒"
  - title: Scale Without Stress
    details: Uses Apache Camel to handle hundreds or thousands of integration endpoints.
    icon: "🚀"
  - title: Open Source
    details: Developed by the community, for the community.
    icon: "🌐"
---

<script setup>
import HomeContent from './.vitepress/theme/components/HomeContent.vue'
</script>

<HomeContent />
