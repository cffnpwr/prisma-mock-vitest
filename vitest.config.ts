import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    environment: "node",
    globals: true,
    include: [
      "__tests__/**/*.test.ts",
    ],
    coverage: {
      enabled: true,
      include: ["src/**"],
      reporter: ["html"],
    },
  },
})