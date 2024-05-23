if command -qv nnn
    set -gx NNN_OPTS "x"
    set -gx NNN_COLORS "2136"
    set -gx NNN_ARCHIVE "\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)\$"
    set -gx NNN_PLUG 'z:autojump;d:dragdrop;s:!fish -i*;e:-!nvim "$nnn"*;p:preview-tui;c:!convert "$nnn" png:- | xclip -sel clipboard -t image/png*'
    set -gx NNN_BMS "u:$HOME/Onedrive/University;c:$HOME/Codes;d:$HOME/Documents;D:$HOME/Downloads"
    # set -gx sel ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection
    set -gx sel $HOME/.config/nnn/.selection
    # Setup quitcd
    if test -f /usr/share/nnn/quitcd/quitcd.fish
        source /usr/share/nnn/quitcd/quitcd.fish
    end
    # Setup nnn cd
    function nnn_cd
        if not test -z $NNN_PIPE
            printf "%s\0" "0c$PWD" > $NNN_PIPE &
            disown
        end
    end
    trap nnn_cd EXIT

    # With the original prompt function renamed, we can override with our own.
    if not test -z "$NNNLVL"
        functions -c fish_prompt _old_prompt_before_nnn
        function fish_prompt
            # Save the return status of the last command.
            set -l old_status $status

            # Output the venv prompt; color taken from the blue of the Python logo.
            printf "\n%s%s%s" (set_color -o) "(In NNN$NNNLVL) " (set_color normal)

            # Restore the return status of the previous command.
            echo "exit $old_status" | .
            # Output the original/"old" prompt.
            _old_prompt_before_nnn
        end
    end
end
