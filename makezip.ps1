# Powershell 7

param(
  [switch]$zip,
  [switch]$clean
)

$proj = "姓名23xxxxxx_作业序号_作业名称"
$target = "$proj.zip"
$materials = (
"$proj.pdf",
"tex/main.tex",
"tex/bjtuhw.cls",
"tex/img/"
# "code/"
)

function help_print() {
  echo "Usage: .\make.ps1 [-zip | -clean]"
  ## in fact, short flag "-z" or "-c" is available because of powershell feture
}

function zip_press() {
  cp "tex/main.pdf" "$proj.pdf"
  7z a "$target" $materials
}

function clean_target() {
  if (test-path $target) {
    rm $target
  }
}

$ok = $false

if ($zip -and $clean) { help_print; $ok = $true }

if ($zip) { zip_press; $ok = $true }
if ($clean) { clean_target; $ok = $true }

if (! $ok) {
  echo "zip: $zip, clean: $clean"
  help_print
}

# start "https://mis.bjtu.edu.cn"
