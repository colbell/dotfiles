function P --description 'Display an easy to read $PATH'

  # This won't work if ant directories have spaces in the name.'
  echo $PATH | tr -s ' ' '\n'
end
