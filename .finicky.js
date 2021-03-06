module.exports = {
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: finicky.matchHostnames(['bitbucket.org', 'atlassian.net']),
      browser: 'Brave Browser',
    },
    {
      match: ({ url }) => url.host.includes('modulz'),
      browser: 'Brave Browser',
    },
  ],
}
