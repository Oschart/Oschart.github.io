// @ts-check
import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// Deployed to GitHub Pages from the Oschart.github.io repo. `site` must match
// the live origin — it is what @astrojs/sitemap writes into sitemap-index.xml.
// No `base`: a <user>.github.io repo is served at the origin root. Renaming the
// repo would move it under a subpath and break every asset link.
// To move to a custom domain: change `site` and add public/CNAME with the bare
// hostname. As of this commit oschart.dev and mghanem.dev were both available.
export default defineConfig({
  site: 'https://oschart.github.io',
  integrations: [mdx(), sitemap()],
});
