/**
 * Single source of truth for identity and links.
 * Every page reads from here — change a value once and it updates everywhere.
 */
export const site = {
  name: 'Mohamed Ghanem',
  /** Visible headings only (hero, CV page). `name` stays plain for titles, meta and initials. */
  displayName: 'Mohamed “Oscar” Ghanem',
  /** Shown under your name in the hero and in the <title> of every page. */
  role: 'PhD Researcher',
  affiliation: 'CISPA Helmholtz Center for Information Security',
  affiliationUrl: 'https://cispa.de',
  email: 'mohamed.ghanem@cispa.de',

  /** One or two sentences. Used for the meta description and social previews. */
  tagline:
    'PhD student at TUM and CISPA working on machine learning — Neural ODEs for continuous-depth models and rough path theory for sequence modeling.',

  /** The main bio on the homepage. Plain paragraphs, rendered in order. */
  bio: [
    'Better known as “Oscar” 😊',
    'I am a Ph.D. student at Technical University of Munich working at the CISPA Helmholtz Center for Information Security. I am also a member of the TUM Graduate School.',
    'My primary research interest is Machine Learning. More broadly, I am interested in exploring underutilized mathematical frameworks and adapting them to machine learning settings, bridging the gap between abstract theory and practical algorithms. In this direction, my current work engages with Neural ODEs as continuous-depth models for dynamical systems, and Rough Path Theory as a general mathematical tool for sequence modeling.',
  ],

  /** Research areas listed as tags in the hero. Delete the array to hide them. */
  interests: ['Neuro-symbolic Computing', 'Sequential Decision Making', 'Reinforcement Learning'],

  /** Path in public/ — replace the placeholder file with a real headshot. */
  avatar: '/avatar.jpg',
  /** Path in public/ — replace the placeholder with your real CV export. */
  cvPdf: '/cv.pdf',

  /**
   * Social links. Delete any line you do not want shown; the UI renders
   * whatever is present, so there is nothing else to update.
   * `icon` must match a key in src/components/SocialLinks.astro.
   */
  socials: [
    { label: 'Google Scholar', href: 'https://scholar.google.com/citations?user=yPs4CdMAAAAJ', icon: 'scholar' },
    { label: 'GitHub', href: 'https://github.com/Oschart', icon: 'github' },
    { label: 'LinkedIn', href: 'https://www.linkedin.com/in/maghanem', icon: 'linkedin' },
  ],
} as const;

/** Number of publications to surface on the homepage before "see all". */
export const HOMEPAGE_PUBLICATION_COUNT = 3;
