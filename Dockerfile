FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

RUN npm run build

FROM node:20-alpine

WORKDIR /app

COPY --from=build /app/dist ./dist

EXPOSE 4321

# Comando para iniciar la aplicación Astro
# Asegúrate de que tu package.json tenga un script "start" o "preview"
# Si usas el comando "start" para producción (normalmente para un servidor custom)
CMD ["npm", "start"]
# Si quieres usar "astro preview" para servir los archivos estáticos generados
# CMD ["npx", "astro", "preview", "--host", "0.0.0.0"]