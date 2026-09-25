---
title: 'TODO: Your first post'
description: 'TODO: one sentence — shown in the post list and in link previews.'
pubDate: 2026-07-31
tags: ['TODO']
draft: true
---

This file is a placeholder. Delete it and write your own, or edit it in place.

## How posting works

Drop a `.md` or `.mdx` file into `src/content/blog/`. The filename becomes the
URL, so `attention-is-overrated.md` is served at `/blog/attention-is-overrated`.

The frontmatter above is validated at build time. `title`, `description`, and
`pubDate` are required — leave one out and the build fails with an error naming
this file rather than publishing something broken.

Set `draft: true` to keep a post out of the listing and the sitemap while you
work on it.

## Formatting

Standard Markdown works: **bold**, *italic*, [links](https://example.com), and
lists.

Code blocks are syntax-highlighted:

```python
def attention(q, k, v):
    scores = q @ k.T / math.sqrt(q.shape[-1])
    return scores.softmax(dim=-1) @ v
```

> Blockquotes render like this.

Inline math and diagrams are not set up — say the word if you want KaTeX for
equations, which is a common thing to want on a research blog.
