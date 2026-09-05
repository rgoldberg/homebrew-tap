# mas Homebrew Custom Tap

mas Homebrew formulae with bottles for older macOS versions.

## Formula Selection

A versioned formula exists for each mas major version. The `mas` formula is an
alias for the current versioned formula:

| Formula | macOS Versions |
|:--------|:---------------|
| mas@1   | 10.13+         |
| mas@2   | 10.15+         |
| mas@3   | 10.15+         |
| mas@4   | 10.15+         |
| mas@5   | 13+            |
| mas@6   | 13+            |
| mas@7   | 13+            |
| mas     | 13+            |

## Installation

In all command lines below, replace `/mas` with `/` followed by the formula
you've chosen.

```shell
brew install mas-cli/tap/mas
```

Or, in a [`brew bundle`](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
`Brewfile`:

```ruby
tap "mas-cli/tap"
brew "mas-cli/tap/mas"
```

## Uninstallation

If you want to remove this formula & custom tap (possibly before switching to
the Homebrew Core `mas` formula):

```shell
brew uninstall mas-cli/tap/mas
brew untap mas-cli/tap
```

## Homebrew Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).

## License

Licensed under the [MIT license](LICENSE).
