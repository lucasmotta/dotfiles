# dotfiles

```bash
git clone git@github.com:lucasmotta/dotfiles.git
cd dotfiles
./install.sh
```

## Tooling

- Formulae and casks are managed in [`Brewfile`](./Brewfile) via `brew bundle`.
- Run all checks with:
  ```bash
  ./scripts/check.sh
  ```
- Install git hooks with:
  ```bash
  pre-commit install --install-hooks
  ```

## Manual config

### Ghostty

- Config is stored in [`ghostty`](./ghostty).
- `./install.sh` symlinks it to `~/Library/Application Support/com.mitchellh.ghostty/config`.

### VSCode

- Install [sync-settings](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
- Configure it using secret gist config
- Run `Sync: Download Settings`

### Twitch token (optional)

- Set `TWITCH_OAUTH_TOKEN` in your shell environment to use Twitch auth headers in `twitch` helpers.
- If unset, scripts still work but run without auth headers.

## Credits

### Dotfiles

This setup was inspired by [peduarte/dotfiles](https://github.com/peduarte/dotfiles).
