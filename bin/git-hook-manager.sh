SCRIPT_DIR=$(dirname $0)
CURRENT_DIR=$(basename "$PWD")

for file in $SCRIPT_DIR/../git-hooks/*; do
  # TODO: We issue the (almost) same command twice now. Terrible of course..
  DIRNAME=$(basename $file | sed -e 's/_/\n/g' | sed -n 1p)
  HOOKNAME=$(basename $file | sed -e 's/_/\n/g' | sed -n 2p)
  if [ "$CURRENT_DIR" == "$DIRNAME" ]; then
    # TODO: Check if this covers all edge cases too.
    echo $(cp -n -v $file "$PWD/.git/hooks/$HOOKNAME")
    exit 0
  fi
done

echo "No Git hook found for directory: $CURRENT_DIR"
exit 1
