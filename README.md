# vimfiles

This is my vim config. There are many like it but this one is mine.

## Getting going

The idea is:
- clone this to your home directory, renaming it `.vim`
- run `./update_bundles`
- symlink to the included `.vimrc`: something like `ln -s ~/.vim/.vimrc ~/.vimrc`
- open vim and run `:Helptags` (capital 'H') to get your docs hooked up

## Gotchas

`update_bundles` is a Ruby script, so make sure you have Ruby installed.

