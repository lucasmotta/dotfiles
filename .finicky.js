module.exports = {
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: finicky.matchHostnames([
        'bitbucket.org',
        'atlassian.net',
        'blissful-life.atlassian.net',
        'maharishi-foundation.atlassian.net',
      ]),
      browser: 'Brave',
    },
    {
      match: ({ url }) => url.host.includes('modulz'),
      browser: 'Brave Browser',
    },
  ],
}
