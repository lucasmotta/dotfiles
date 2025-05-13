module.exports = {
  defaultBrowser: 'Arc',
  handlers: [
    // Open localhost on Firefox
    {
      match: finicky.matchDomains('localhost'),
      browser: 'Firefox',
    },
    // Open Zoom links directly in the app
    {
      match: ['zoom.us/*', finicky.matchDomains(/.*\zoom.us/), /zoom.us\/j\//],
      browser: 'us.zoom.xos',
    },
    // Open workos on Firefox
    {
      match: /workos/,
      browser: 'Firefox',
    },
    // Figma
    {
      match: 'https://www.figma.com/file/*',
      browser: 'Figma',
    },
  ],
  rewrite: [
    // Remove marketing tags from url
    // https://github.com/johnste/finicky/wiki/Configuration-ideas#remove-all-marketingtracking-information-from-urls
    {
      match: () => true,
      url: ({ url }) => {
        const removeKeysStartingWith = ['utm_', 'uta_', 'matt_']
        const removeKeys = ['fbclid', 'gclid']

        const search = url.search
          .split('&')
          .map((parameter) => parameter.split('='))
          .filter(
            ([key]) =>
              !removeKeysStartingWith.some((startingWith) =>
                key.startsWith(startingWith)
              )
          )
          .filter(([key]) => !removeKeys.some((removeKey) => key === removeKey))

        return {
          ...url,
          search: search.map((parameter) => parameter.join('=')).join('&'),
        }
      },
    },
  ],
}
