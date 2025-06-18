// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

const repo = 'ProyectoTesis';

export default defineConfig({
  base: `/${repo}/`, // ✅ Ruta base para GitHub Pages
  vite: {
    plugins: [tailwindcss()]
  }
});
