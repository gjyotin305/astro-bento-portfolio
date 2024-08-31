FROM node:20-slim

WORKDIR /astro-bento-portfolio/

EXPOSE 4321

COPY public/ /astro-bento-portfolio//public
COPY src/ /astro-bento-portfolio//src
COPY package.json /astro-bento-portfolio/
COPY postcss.config.cjs /astro-bento-portfolio/
COPY svelte.config.js /astro-bento-portfolio/
COPY astro.config.mjs /astro-bento-portfolio/
COPY tsconfig.json /astro-bento-portfolio/
COPY uno.config.ts /astro-bento-portfolio/

RUN npm install

CMD ["npm", "run", "dev", "--host"]