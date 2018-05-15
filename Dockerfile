FROM node
WORKDIR .
COPY package.json . /
COPY package-lock.json ./
# COPY server.js ./
# RUN npm i -S mongoose
RUN npm install
# CMD service mongod start
CMD npm start
EXPOSE 6060

