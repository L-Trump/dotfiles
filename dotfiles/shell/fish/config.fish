if status is-interactive
# set xdg-desktop-portal
    set -gx GTK_USE_PORTAL 1

# auto login
    if test -z $DISPLAY; and test $XDG_VTNR -eq 1; and test (tty)="/dev/tty1"; and test "$(fgconsole 2>/dev/null || echo 1)" -eq 1
        exec startx
    end
end
