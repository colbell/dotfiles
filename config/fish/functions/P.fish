function P --description 'Display an easy to read $PATH'
  # This won't work if any directories have spaces in the name.'
  echo $PATH | tr -s ' ' '\n'
end
