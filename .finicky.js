module.exports = {
  defaultBrowser: 'Brave Browser',
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
