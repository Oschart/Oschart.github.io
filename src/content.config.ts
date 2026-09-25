import { defineCollection } from 'astro:content';
import { file, glob } from 'astro/loaders';
import { z } from 'astro/zod';

/**
 * Publications live in one YAML file rather than one file per paper — adding a
 * paper should be a five-line paste, not a new file.
 *
 * The schema is strict on purpose: a typo'd field name or a missing `year`
 * fails `npm run build` with an error naming the offending entry, rather than
 * silently rendering a blank card that you notice six months later.
 */
const publications = defineCollection({
  loader: file('src/data/publications.yaml'),
  schema: z.object({
    title: z.string(),
    authors: z.array(z.string()).nonempty(),
    venue: z.string(),
    year: z.number().int(),
    /** Promotes the entry to the homepage's selected-work section. */
    selected: z.boolean().default(false),
    /**
     * Moves the entry out of the peer-reviewed list into the Preprints panel.
     * A flag rather than a check on `venue` so the panel never depends on how
     * a venue string happens to be spelled.
     */
    preprint: z.boolean().default(false),
    abstract: z.string().optional(),
    links: z
      .object({
        pdf: z.url().optional(),
        arxiv: z.url().optional(),
        code: z.url().optional(),
        slides: z.url().optional(),
        video: z.url().optional(),
        doi: z.url().optional(),
      })
      .default({}),
  }),
});

const blog = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    tags: z.array(z.string()).default([]),
    /** Set true to keep a post out of the listing and the sitemap. */
    draft: z.boolean().default(false),
  }),
});

export const collections = { publications, blog };
