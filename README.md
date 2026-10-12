# LitrAI 📚✨

![LitrAI Homepage Mockup](file:///C:/Users/DELL/.gemini/antigravity-ide/brain/4e60b71a-950f-4b31-bec6-a9df9b5a310e/litrai_homepage_mockup_1791801819924.jpg)

---

## Overview
LitrAI is a modern, AI‑powered literature summarization web application. It lets users paste or upload scientific papers, PDFs, or URLs and instantly receive concise, well‑structured summaries, key insights, and actionable take‑aways. Built with **React**, **Vite**, **TailwindCSS**, and **TRPC**, the app showcases a premium glass‑morphism UI with smooth micro‑animations.

---

## Features
- **Instant Summaries** – Powered by state‑of‑the‑art language models.
- **Citation Extraction** – Auto‑detects and formats references.
- **Customizable Prompts** – Choose summary length, tone, and focus.
- **Dark Glassmorphism UI** – Vibrant gradients, subtle hover effects, and polished animations.
- **Responsive Design** – Works on desktop, tablet, and mobile.
- **Server‑Side Rendering (SSR) optional** – Ready for SEO & fast first paint.
- **Extensible Plugin System** – Add new AI models or post‑processing steps.

---

## Tech Stack
| Layer | Technology |
|-------|------------|
| **Frontend** | React 19, Vite, TailwindCSS, Radix UI components, Framer Motion |
| **Backend** | Express, TRPC, Zod, Better‑SQLite3 (local dev DB) |
| **State Management** | @tanstack/react-query |
| **Styling** | TailwindCSS v4, tailwind‑merge, tw‑animate‑css |
| **Build** | Vite, TSX (TypeScript) |
| **Testing** | Vitest (future) |

---

## Quick Start
```bash
# Clone the repo
git clone https://github.com/yourusername/litrAI.git
cd litrAI

# Install dependencies (npm or yarn)
npm install   # or: yarn install

# Create a .env file (see below) and set your AI API key.
cp .env.example .env
# Edit .env with your credentials

# Run the development server
npm run dev   # runs `tsx server/_core/index.ts` & Vite dev server
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
│  │  └─ pages/           # Page components (Home, Summarize, Settings)
│  └─ index.html
├─ server/                 # Express + TRPC backend
│  ├─ _core/
│  │  └─ index.ts        # Entry point (starts Express + TRPC)
│  └─ routes/            # API routes (auth, summarize, health)
├─ drizzle/                # Database schema & migrations (Drizzle ORM)
├─ shared/                # Shared TypeScript types & utils
├─ .env.example           # Example env file
├─ package.json           # Scripts, deps, etc.
├─ tsconfig.json          # TypeScript config
└─ vite.config.ts         # Vite configuration
```

*Clickable file links:* 
- [package.json](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/package.json) 
- [tsconfig.json](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/tsconfig.json) 
- [vite.config.ts](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/vite.config.ts) 
- [server entry](file:///e:/Tasnim/Tasneem_Career_AI/Github_Projects/completed%20projects/LitrAI/server/_core/index.ts)

---

## Environment Variables
Create a `.env` file at the root (copy from `.env.example`). Required keys:
```
# OpenAI or Cohere API key for summarization
AI_API_KEY=your_api_key_here
# Port for the Express server (default 4000)
PORT=4000
# Optional: LOG_LEVEL=debug
```

---

## Development Scripts
| Script | Description |
|--------|-------------|
| `npm run dev` | Starts the Express server (`tsx server/_core/index.ts`) **and** Vite dev server (hot‑reloading). |
| `npm run build` | Generates a production‑ready bundle in `dist/`. |
| `npm start` | Runs the compiled production server (`node dist/index.js`). |
| `npm run lint` | Runs ESLint & Prettier checks (future). |
| `npm test` | Placeholder for Vitest unit tests. |

---

## Contributing
1. Fork the repository.
2. Create a feature branch (`git checkout -b feat/awesome-feature`).
3. Commit your changes with clear messages.
4. Open a Pull Request against `main`.
5. Ensure linting passes (`npm run lint`).

---

## License
Distributed under the MIT License. See `LICENSE` for more information.

---

## Screenshots
Below is the sleek homepage mockup generated for LitrAI. The actual UI follows this design language, with live data populated via the backend.

![Homepage Mockup](file:///C:/Users/DELL/.gemini/antigravity-ide/brain/4e60b71a-950f-4b31-bec6-a9df9b5a310e/litrai_homepage_mockup_1791801819924.jpg)

---

> **Note**: The mockup is for visual reference only – the current implementation may evolve.
