# build env, use alpine version
FROM node:14.17.5-alpine as builder

ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION:-v1.0.0}

WORKDIR /src

COPY . .

# install npm package, devDependencies are also installed
RUN npm install

# set the app version
RUN npm version ${APP_VERSION}

# build files to dist folder
RUN npm run build

# remove node_modules, because we don't want to devDependencies package.
RUN rm -rf node_modules

# install npm package again, use `--production` this will not install devDependencies package.
# note if you use @nuxtjs/pwa you should move to dependencies block, otherwise an error will occur.
RUN npm install --production

#  runtime env, use alpine version
FROM node:14.17.5-alpine as Runtime

WORKDIR /app

# copy the builder folder to now(/app) location.
COPY --from=builder /src .

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["npm", "start"]