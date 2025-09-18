#/bin/bash
main() {
  scriptdir=$BASH_SOURCE
  curdir=$(realpath .)
  if [ $1 = "" ]; then exportmd && exit 0; fi
  if [ $1 = "md" || $1 = "markdown" ]; then exportmd && exit 0; fi
  if [ $1 = "tex" || $1 = "latex" ]; then export tex && exit 0; fi

  help_msg
  exit 1
}

help_msg() {
  echo Usage: "export.bat [md|markdown|tex|latex]"
  echo If no argument is provided, it defaults to export Markdown.
}

exportmd() {
  cp -r "$scriptdir/Markdown" "$curdir/md"
}

exporttex() {
  cp -r "$scriptdir/LaTeX" "$curdir/tex"
}
