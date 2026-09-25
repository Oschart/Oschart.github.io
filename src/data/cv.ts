/**
 * The HTML CV at /cv is rendered from this file.
 *
 * NOTE: public/cv.pdf is a SEPARATE file and is NOT generated from this data.
 * If you edit here, re-export the PDF too, or the two will drift apart.
 *
 * This is TypeScript rather than YAML (unlike publications) for two reasons:
 * section order is guaranteed by the array, and `astro check` type-checks every
 * entry. A CV is one static document edited rarely, so it does not need the
 * per-entry schema validation that a growing publication list does.
 *
 */

export type CvEntry = {
  title: string;
  organization?: string;
  organizationUrl?: string;
  location?: string;
  /** Free text — '2024', 'Sep 2024', whatever reads well. */
  start?: string;
  /** Omit for a single-date entry such as an award. */
  end?: string;
  details?: string[];
};

export type CvSection = {
  heading: string;
  entries: CvEntry[];
};

/** Delete a whole section to remove it from the page. */
export const cvSections: CvSection[] = [
  {
    heading: 'Education',
    entries: [
      {
        title: 'PhD in Computer Science',
        organization: 'Technical University of Munich',
        organizationUrl: 'https://www.tum.de',
        location: 'Munich, Germany',
        start: '2024',
        end: 'present (expected 2028)',
        details: ['Advisor: Prof. Bernd Finkbeiner.', 'Member of the TUM Graduate School.'],
      },
      {
        title: 'M.Sc. in Computer Science',
        organization: 'Saarland University',
        organizationUrl: 'https://www.uni-saarland.de',
        location: 'Saarbrücken, Germany',
        start: '2021',
        end: '2024',
        details: [
          'GPA: 1.3 (German scale, 1.0 = best).',
          'Graduate coursework: Reinforcement Learning, Machine Learning in Cybersecurity, Neuro-Symbolic Computing, Automated Reasoning, Security, Machine Learning for Program Analysis, Automated Debugging.',
        ],
      },
      {
        title: 'B.Sc. in Computer Engineering',
        organization: 'The American University in Cairo',
        organizationUrl: 'https://www.aucegypt.edu',
        location: 'Cairo, Egypt',
        start: '2016',
        end: '2021',
        details: [
          'GPA: 3.97/4.0 (American scale); Minor in Mathematics, GPA: 4.0/4.0.',
          'B.Sc. Thesis: "FLoBC: A Decentralized Blockchain-Based Federated Learning Framework."',
          'Mathematics Thesis: "On Theoretical Complexity and Boolean Satisfiability."',
        ],
      },
    ],
  },
  {
    heading: 'Experience',
    entries: [
      {
        title: 'Doctoral Researcher',
        organization: 'CISPA Helmholtz Center for Information Security',
        location: 'Saarbrücken, Germany',
        start: '2024',
        end: 'present',
        details: [
          'Develop neuro-symbolic techniques for formal reasoning domains.',
          'Designed NeuRes, a framework for learning to solve Boolean Satisfiability.',
        ],
      },
      {
        title: 'Machine Learning Engineer',
        organization: 'Spree3D',
        start: '2021',
        end: '2023',
        details: [
          'Developed an automated evaluation suite for Virtual Try-On models with neural KPIs such as structural similarity.',
          'Built an end-to-end deep learning pipeline for volumetric 3D hair generation from portrait images.',
          'Implemented and tuned a state-of-the-art video segmentation model that served most of our machine learning pipelines.',
          'Ran large-scale GAN-based dataset generation producing terabytes of training data.',
          'Collaborated on a deep learning pipeline producing 3D head geometry from portrait images.',
        ],
      },
      {
        title: 'Research Assistant',
        organization: 'Max Planck Institute for Software Systems (MPI-SWS)',
        start: '2022',
        end: '2023',
        details: [
          'Developed a PyTorch implementation of a meta-learning technique that outperformed most benchmarks.',
          'Built a unifying Python library for prominent reward-shaping techniques, in the style of stable-baselines3.',
        ],
      },
      {
        title: 'Automated Reasoning Tutor',
        organization: 'Max Planck Institute for Informatics (MPI-INF)',
        start: '2021',
        end: '2022',
        details: [
          'Conducted weekly tutorials on the foundations of automated theorem provers.',
          'Graded and gave feedback on student submissions.',
        ],
      },
      {
        title: 'Data Scientist',
        organization: 'Turing.com',
        start: '2021',
        details: [
          'Developed an adaptive time-series model for predicting ad-campaign revenue that remains in production use.',
          'Created automated analytics reports for product and marketing teams.',
        ],
      },
      {
        title: 'Software Engineer',
        organization: 'Nabta Health Ltd.',
        start: '2019',
        end: '2020',
        details: [
          'Created React Native components for four of the main app\'s primary features.',
          'Built NFC temperature sensor drivers on both native platforms (Android Java and iOS Objective-C).',
          'Implemented REST APIs for content fetching and database synchronization.',
        ],
      },
    ],
  },
  {
    heading: 'Awards',
    entries: [
      {
        title: '2nd Place, C(4F)2 Artificial Intelligence Hackathon (Students Track)',
        organization: 'Dell',
        start: '2021',
      },
      {
        title: 'Finalist, ACM Egyptian Collegiate Programming Contest (ECPC)',
        start: '2018',
        end: '2019',
      },
      {
        title: 'Contestant, ACM Arab and African Collegiate Programming Contest (ACPC)',
        start: '2018',
        end: '2019',
      },
      {
        title: 'Full-Tuition PSSF Scholarship (115,000 USD)',
        organization: 'The American University in Cairo',
        details: ['Awarded for outstanding academic performance.'],
        start: '2016',
      },
    ],
  },
  {
    heading: 'Teaching & Service',
    entries: [
      {
        title: 'Tutor, Neuro-Symbolic Computing Seminar',
        organization: 'CISPA Helmholtz Center for Information Security',
        start: '2024',
      },
      {
        title: 'Reviewer, NeurIPS',
        start: '2025',
        end: '2026',
      },
      {
        title: 'Reviewer, ICLR',
        start: '2026',
      },
      {
        title: 'Reviewer, ICML',
        start: '2026',
        details: ['Recognized as a Silver Reviewer.'],
      },
      {
        title: 'Subreviewer, AAAI',
        start: '2025',
      },
    ],
  },
];
