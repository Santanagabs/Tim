import { type PlaywrightTestConfig, devices } from '@playwright/test';

const config: PlaywrightTestConfig = {
reporter: [['html', {outputFolder: 'report'}]],
  use: {
    headless: false,
    screenshot: 'on',
    video: 'on',
  },
    
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    // {
    //   name: 'firefox',
    //   use: { ...devices['Desktop Firefox'] },
    // },
    // {
    //   name: 'webkit',
    //   use: { ...devices['Desktop Safari'] },
    // },
    // {
    //   name: 'mobile safari',
    //   use: { ...devices['Iphone X'] },
    // },
    // {
    //   name: 'mobile chromium',
    //   use: { ...devices['Galaxy S8'] },
    // },
  ],
};
export default config;