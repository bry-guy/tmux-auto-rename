Rename tmux window with current directory name.

## Credit

Forked from [KeyesHsu/tmux-auto-rename](https://github.com/KeyesHsu/tmux-auto-rename). Thanks @KeyesHsu!

## Usage

`tmux-auto-rename` will automatically be invoked when you select a pane, window, or create a new window.

To invoke it manually, call `refresh-client`. Bind a hotkey in your `.tmux.conf` to make refreshing easy:

```
bind R refresh-client
```

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```tmux.conf
set -g @plugin 'bry-guy/tmux-auto-rename'
```

Hit `prefix + I` to fetch the plugin and source it. You should now be able to use the plugin.


## Options

### `@auto-rename-git-only`

Automatically rename in Git repositories only.

Default: `on`

```sh
set -g @auto-rename-git-only "off"
```

### `@auto-rename-replace-home`

Automatically rename `$HOME` to `~`.

Default: `on`

```sh
set -g @auto-rename-replace-home "off"
```

##### Resources:
* [Changelog](CHANGELOG.md)


## Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page](https://github.com/bry-guy/tmux-auto-rename/issues). 

## License

Copyright © 2023 [Bryan Smith](https://github.com/bry-guy).

This project is [MIT](https://github.com/bry-guy/tmux-auto-rename/blob/main/LICENSE) licensed.
