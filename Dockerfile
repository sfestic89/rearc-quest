# Use Node.js as base
FROM node:16

# Create working directory
WORKDIR /usr/src/app

# Copy the Node app code
COPY src/ ./src/

# Copy the Go backend binary (adjust if using different file)
COPY bin/001 ./bin/quest-backend
RUN chmod +x ./bin/quest-backend

# Inject environment variable (will override at runtime)
ENV SECRET_WORD=changeme

# Expose app port
EXPOSE 3000

# Start the app (adjust if you have a start script or different entry point)
CMD ["node", "src/000.js"]
