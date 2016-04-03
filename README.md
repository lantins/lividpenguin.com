# lividpenguin.com website

## Cheat Sheet

```bash
# Start local development server
make serve
# Generate website
make
# Sync generated content with S3
make deploy
```

## Prepare development environment (OS X)

```bash
# Static site generator
brew install hugo
# CSS pre-processor
brew install sassc
# AWS CLI (to sync generated content with S3)
brew install awscli
# Used to watch SASS files for changes and re-run sassc
go get -u github.com/cespare/reflex
# Used to start `reflex` and `hugo serve`
go get -u github.com/ddollar/forego
```
