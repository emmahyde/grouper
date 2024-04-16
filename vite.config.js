import ViteRails from "vite-plugin-rails"
import { resolve } from "path"
import { defineConfig } from "vite"

export default defineConfig({
  plugins: [
    ViteRails({
      fullReload: false,
      
    }),
  ],
  resolve: {
    alias: {
      '@assets/': `${resolve(__dirname, 'app/assets')}/`,
    },
  },
})
