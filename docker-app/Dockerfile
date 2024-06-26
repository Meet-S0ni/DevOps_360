# Stage 1
# FROM node:20.15.0-alpine as build
FROM node:20.15.0-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

# Stage 2 
# WORKDIR /app
# COPY --from=build /app .
EXPOSE 3000
CMD ["node", "app.js"]
