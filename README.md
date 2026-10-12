# LitrAI 📚

[![Build Status](https://img.shields.io/badge/build-passing-success)](https://github.com/yourusername/litrAI/actions)
[![npm version](https://img.shields.io/npm/v/litrAI.svg?style=flat)](https://www.npmjs.com/package/litrAI)
[![License](https://img.shields.io/github/license/yourusername/litrAI.svg)](LICENSE)

---

## Overview
LitrAI is a modern, AI-powered literature summarization web application that transforms scientific papers, PDFs, or URLs into concise, well-structured summaries. It extracts key insights, highlights essential arguments, and provides formatted citations, making literature review faster and more efficient.

Under the hood, LitrAI leverages **large language models** (OpenAI GPT-4, Cohere, or any compatible endpoint) via a thin TRPC wrapper, enabling easy replacement of the inference provider.

---

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Environment Variables](#environment-variables)
- [Development Scripts](#development-scripts)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [FAQ](#faq)
- [Roadmap](#roadmap)
- [License](#license)
- [Author](#author)

---

## Features
- **Instant Summaries** – Powered by state-of-the-art language models (OpenAI GPT-4, Cohere).
- **Citation Extraction** – Auto-detects and formats references in APA/MLA.
- **Customizable Prompts** – Adjust length, tone, and focus based on research needs.
- **Dark Glassmorphism UI** – Modern aesthetics with vibrant gradients, smooth hover effects, and micro-animations.
- **Responsive Design** – Optimized for desktop, tablet, and mobile viewing.
- **SSR (optional)** – Ready for SEO and fast first-paint performance.
- **Extensible Plugin System** – Easily swap AI providers or add custom post-processing pipelines.

---

## Tech Stack
| Layer | Technology |
|---|---|
| **Frontend** | React 19, Vite, TailwindCSS v4, Radix UI, Framer Motion |
| **Backend** | Express, TRPC, Zod, Better-SQLite3 (local dev DB) |
| **State Management** | @tanstack/react-query |
| **Styling** | TailwindCSS, tailwind-merge, tw-animate-css |
| **Build** | Vite, TSX (TypeScript) |
| **Testing** | Vitest (planned) |

---

## Quick Start
```bash
# Clone the repository
git clone https://github.com/yourusername/litrAI.git
cd litrAI

# Install dependencies (npm or yarn)
npm install   # or: yarn install

# Set up environment variables (copy from example)
cp .env.example .env
# Edit .env with your AI API key and any custom settings

# Run the development server (both backend & frontend)
npm run dev
```

The app will be available at `http://localhost:5173`.

---

## Project Structure
```
LitrAI/
├─ client/                 # React UI (Vite entry point)
│  ├─ src/
│  │  ├─ components/      # Radix UI + custom components
│  │  ├─ hooks/           # React Query hooks, TRPC client
│  │  └─ pages/           # Home, Summarize, Settings, etc.
│  └─ index.html
├─ server/                 # Express + TRPC backend
│  ├─ _core/
│  │  └─ index.ts        # Starts Express & TRPC
│  └─ routes/            # API routes (auth, summarize, health)
├─ drizzle/                # DB schema & migrations (Drizzle ORM)
├─ shared/                # Shared TS types & utilities
├─ .env.example           # Example env file
├─ package.json           # Scripts & dependencies
├─ tsconfig.json          # TypeScript config
└─ vite.config.ts         # Vite configuration
```

*Key Project Files:*
- [package.json](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/package.json)
- [tsconfig.json](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/tsconfig.json)
- [vite.config.ts](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/vite.config.ts)
- [server/_core/index.ts](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/server/_core/index.ts)

---

## Environment Variables
Create a `.env` file at the root (copy from `.env.example`). Required keys:
```env
# OpenAI / Cohere API key for summarization
AI_API_KEY=your_api_key_here
# Server port (default 4000)
PORT=4000
# Optional logging level
LOG_LEVEL=debug
```

---

## Development Scripts
| Script | Description |
|---|---|
| `npm run dev` | Starts the Express server (`tsx server/_core/index.ts`) **and** Vite dev server (hot-reloading). |
| `npm run build` | Generates a production-ready bundle in `dist/`. |
| `npm start` | Runs the compiled production server (`node dist/index.js`). |
| `npm run lint` | Runs ESLint & Prettier checks. |
| `npm test` | Placeholder for Vitest unit tests. |

---

## Deployment
### Docker
```bash
# Build the Docker image
docker build -t litrAI:latest .

# Run the container
docker run -p 4000:4000 --env-file .env litrAI:latest
```

### Vercel / Netlify (Frontend only)
- Deploy the `client/` folder using Vercel's CLI: `vercel --prod`
- Ensure the backend API is hosted separately (e.g., Render, Fly.io) and the Vercel environment variables point to it.

---

## Contributing
1. Fork the repository.
2. Create a feature branch (`git checkout -b feat/awesome-feature`).
3. Commit your changes with clear messages.
4. Open a Pull Request against `main`.
5. Run lint checks (`npm run lint`).

We welcome improvements to the UI, new AI provider integrations, and documentation enhancements.

---

## Code of Conduct
Please read our [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).

---

## FAQ
**Q:** *Which AI models are supported?*  
**A:** Any model exposing a RESTful completions endpoint compatible with OpenAI's API schema (e.g., OpenAI GPT-4, GPT-3.5, Cohere, Anthropic). Configure the endpoint and API key in `.env`.

**Q:** *Can I run LitrAI locally without an internet connection?*  
**A:** Not currently – the summarization relies on external LLM APIs. However, you can self-host a compatible open-source model and point `AI_API_KEY` to its endpoint.

**Q:** *How does citation extraction work?*  
**A:** The backend parses the PDF/text, identifies reference patterns, and uses the LLM to format them according to the selected citation style.

---

## Roadmap
- [ ] Add support for **batch summarization** of multiple papers.
- [ ] Integrate **Vector DB** for semantic search across uploaded literature.
- [ ] Provide **browser extension** to summarize web articles on-the-fly.
- [ ] Create **Docker Compose** setup for easy local multi-service deployment.
- [ ] Publish the package to **npm** for reusable summarization SDK.

---

## License
Distributed under the MIT License. See `LICENSE` for details.

---

## Author
Tasneem Ibrahim - Mariam Gomaa - Marc Hany
