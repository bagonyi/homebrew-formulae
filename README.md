# Install old version of Homebrew packages

Homebrew makes it somewhat difficult to install older version of packages. This repository contains historic package install scripts, which can be used in tandem with `homebrew extract`.

## How to install a package

```
brew tap bagonyi/homebrew-formulae git@github.com:bagonyi/homebrew-formulae.git
brew tap homebrew/core --force
brew extract --version=1.22 leveldb bagonyi/formulae
brew install leveldb@1.22
```

## How to add a package to this repository

1. Navigate to the commit history of the package you want to install. E.g. https://github.com/Homebrew/homebrew-core/commits/master/Formula/leveldb.rb
2. Click on the `< >` button (Browse the repository at this point in the history) next to the commit you want to use
3. Press `t` to bring up the file search view, search for `leveldb`
4. Open `leveldb.rb`, copy the contents, and paste it into a new file in this repository
