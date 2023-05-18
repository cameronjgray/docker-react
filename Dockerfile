FROM node:16-alpine as builder
WORKDIR '/app'
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# everything else from builder gets dumped
# don't need to start nginx as default command does this
