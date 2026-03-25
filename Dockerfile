FROM node:18-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY app/ ./app/

USER appuser

EXPOSE 3000

CMD ["node", "app/server.js"]