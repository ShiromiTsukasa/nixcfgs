function fish_prompt
    set -l last_status $status
    set -l drive C
    test $last_status -ne 0; and set drive F

    set -l branch ""
    set -l dirty ""
    if command -sq git; and git rev-parse --is-inside-work-tree >/dev/null 2>&1
        test $last_status -eq 0; and set drive G
        set branch (git symbolic-ref --short HEAD 2>/dev/null; or git rev-parse --short HEAD 2>/dev/null)
        if git status --porcelain 2>/dev/null | string length -q
            set dirty 1
        end
    end

    set_color brwhite
    printf '%s:%s' $drive (string upper -- (string replace -a / '\\' -- $PWD))

    if test -n "$branch"
        set_color yellow
        printf ' %s' $branch
        if test -n "$dirty"
            set_color red
            printf ' *'
        else
            set_color green
            printf ' ='
        end
    end

    set_color brwhite
    printf '> '
    set_color normal
end
