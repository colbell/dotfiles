function fish_greeting
  if status --is-interactive
    set -l h (hostname)
    set -l t (date)
    set -l u (uptime)
    echo ""
    echo "$USER, Welcome back to the fish shell on $h at $t"
    echo $u
    echo ""
  end
end
