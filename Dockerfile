
FROM node:20 AS build
WORKDIR /myapp
COPY package.json package-lock.json .
RUN npm install
COPY . .


FROM node:20-alpine
WORKDIR /myapp
COPY --from=build /myapp .
EXPOSE 3000
CMD ["npm", "start"]
