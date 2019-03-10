# build stage
FROM node:10 as build-stage
RUN npm config set registry https://registry.npm.taobao.org/
RUN yarn config set registry https://registry.npm.taobao.org/
WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./
RUN npm install
#https://github.com/yarnpkg/yarn/issues/6700
#RUN yarn install
COPY . ./
RUN npm run build
#RUN yarn run build

# production stage
# /etc/nginx/nginx.conf include /etc/nginx/conf.d/*.conf which has default.conf
# which has root   /usr/share/nginx/html; 
# nginx_default.conf 不能用envsubst 替换，因为 $document_root$fastcgi_script_name;也会被替换
# 用 alpine镜像，image 大小从 147MB 缩小到 54MB
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
