# Install old version of Homebrew packages

Homebrew makes it somewhat difficult to install older version of packages. This repository contains historic package install scripts, which can be used in tandem with `homebrew extract`.

## How to install a package

```
brew extract --version=1.22 leveldb bagonyi/formulae
brew install leveldb@1.22
```
