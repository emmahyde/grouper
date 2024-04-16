import { resolve } from "path"
import { defineConfig } from "vite"
import Rails from "vite-plugin-rails"

export default defineConfig({
  // server: {
    // fs: { allow: [Array], strict: true },
    // host: 'localhost',
    // https: null,
    // port: 3036,
    // strictPort: true,
    // hmr: { clientPort: 3039 }
  // },
  plugins: [
    Rails({
      envVars: { RAILS_ENV: "development" },
      fullReload: ["config/routes.rb", "app/views/**/*"],
      stimulus: true,
    }),
  ],
  resolve: {
    alias: {
      "@assets/": `${resolve(__dirname, "app/assets")}/`,
    },
  },
})

