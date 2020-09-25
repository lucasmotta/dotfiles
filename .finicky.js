module.exports = {
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: finicky.matchHostnames([
        'bitbucket.org',
        'atlassian.net',
        'blissful-life.atlassian.net',
      ]),
      browser: 'Opera',
    },
  ],
}
