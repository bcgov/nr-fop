import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: 'https://nr-fop-test-frontend.apps.silver.devops.gov.bc.ca/',
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    experimentalStudio: true,
    experimentalWebKitSupport: true,
  },
});
