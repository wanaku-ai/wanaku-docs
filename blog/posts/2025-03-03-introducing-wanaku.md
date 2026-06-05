---
title: "Introducing Wanaku: The First Open-Source MCP Router"
date: 2025-03-03
author: Ivo Bek
tags:
  - announcement
  - mcp
  - open-source
description: "Wanaku is the first open-source MCP Router that transforms how agentic applications integrate with enterprise systems."
---

# Introducing Wanaku: The First Open-Source MCP Router

Wanaku is the first open-source MCP Router that transforms how agentic applications integrate with enterprise systems. Think of it as a receptionist — Wanaku greets AI agents, checks their access, and sends them to the appropriate enterprise resources.

## The Challenge

While AI agents and LLMs are advancing quickly, connecting them to enterprise data remains awkward. Early agentic applications suffer from duplicated integration code and configurations, making it hard to maintain and scale. Enterprises require strict access control, auditing, and error handling, which are difficult given the autonomous, stochastic nature of LLMs.

## The Opportunity

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) is an emerging standard for linking LLMs to external data. Over 1,500 MCP servers already exist, though quality varies. Wanaku uses proven integration technology like [Apache Camel](https://camel.apache.org/) to manage large numbers of integrations reliably.

## What Wanaku Offers

- **Unified Integration** — a single system for connecting agentic applications
- **CLI/UI** — for quickly exposing resources and adding tools, with support for HTTP, Kafka, FTP, and more planned
- **Reusable Toolsets** — tools organized and shared across projects
- **Pluggable Architecture** — extensible via Apache Camel

## How It Works

Wanaku sits between autonomous agentic applications and enterprise systems as a router, keeping sensitive data secure while enabling rapid integration and flexibility.

![Wanaku Architecture](/images/wanaku-architecture.jpg)

## Acknowledgments

Special thanks to Otavio Piske, Ivo Bek, Zineb Bendhiba, Ricardo Martinez, Bruno Meseguer, Burr Sutter, Alexandre Kieling, Federico Mariani, and all contributors for their creativity, fellowship, and relentless passion.

We invite you to explore Wanaku and follow future updates. Get started with the [documentation](/docs/) or check out the [source code on GitHub](https://github.com/wanaku-ai/wanaku).
