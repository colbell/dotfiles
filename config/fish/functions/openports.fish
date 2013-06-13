function openports --description 'Display open ports'
  netstat --all --numeric --programs --inet
end
