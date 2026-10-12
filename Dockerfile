# Multi-stage build for LiterAI main application
FROM node:18-alpine AS frontend-builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:18-alpine AS production

# Install Python for any potential Python services
RUN apk add --no-cache python3 py3-pip

WORKDIR /app

# Copy built frontend and dependencies
COPY --from=frontend-builder /app/dist ./dist
COPY --from=frontend-builder /app/node_modules ./node_modules
COPY --from=frontend-builder /app/package*.json ./

# Copy server files
COPY server ./server
COPY drizzle ./drizzle
COPY db ./db
COPY tsconfig.json ./
COPY vite.config.ts ./

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S literai -u 1001 && \
    chown -R literai:nodejs /app

USER literai

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/api/health || exit 1

# Start command
CMD ["npm", "start"]
