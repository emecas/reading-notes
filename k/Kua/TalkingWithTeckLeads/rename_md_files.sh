find $1 -name "* *.md" -type f -print0 | while read -d $'\0' f; do mv -v "$f" "${f// /_}"; done
