import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // don't change host, this lets react files be served over localhost
    port: 3000, // port can be changed but make sure to update docker-compose.yml to expose the proper port
  }
})
