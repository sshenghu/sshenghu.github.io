#!/bin/zsh

set -e

project_dir="${0:A:h}"
preview_dir="/private/tmp/shisheng-personal-website-preview"

# Jekyll 3 and Ruby 4 can hit an encoding error when the project path contains
# non-ASCII characters. Run the preview from an ASCII-only temporary copy.
if [[ "$project_dir" != "$preview_dir" ]]; then
  mkdir -p "$preview_dir"
  rsync -a --delete --exclude='.git/' --exclude='_site/' "$project_dir/" "$preview_dir/"
fi

cd "$preview_dir"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export RUBYOPT="-r./_plugins/ruby_compat.rb"
exec /opt/homebrew/opt/ruby/bin/bundle exec jekyll serve --livereload
