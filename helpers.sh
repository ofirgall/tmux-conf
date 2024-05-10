#!/usr/bin/env bash

# Usage: ./helpers.sh <func> <func args>

# Set tmux path
TMUX_PATH=${TMUX_PATH:=$HOME/.tmux}

function get_pid_in_pane() {
    local tty=$1
    echo "$(ps -f -t $tty | tail -n 1 | tr -s ' ' | cut -f2 -d ' ')"
}

function get_ssh_cmd_in_pane() {
    local tty=$1
    local pid=$(get_pid_in_pane $tty)

    local ssh_cmd=$(cat /proc/$pid/cmdline | sed -e "s/\x00/' '/g" | sed "s/' / /" | sed "s/'$//")
    echo $ssh_cmd
}

function get_ssh_host_in_pane() {
    local tty=$1
    local pid=$(get_pid_in_pane $tty)

    local ssh_cmd=$(cat /proc/$pid/cmdline | sed -e "s/\x00/ /g")
    if ! echo "$ssh_cmd" | cut -d ' ' -f1 | grep "ssh" &> /dev/null; then
        # Not a ssh command
        return
    fi

    local ssh_args=$(echo "$ssh_cmd" | cut -d ' ' -f2-)

    for arg in $ssh_args; do
        # Skip flags
        if [[ ${arg:0:1} == "-" ]]; then
            continue
        fi

        echo $arg
        return
    done
}

function jsonc_to_json() {
    # Remove comments https://unix.stackexchange.com/a/384019
    cat $1 | sed 's|[[:blank:]]*//.*||;
                  s|[[:blank:]]*#.*||;
                  t prune
                  b
                  :prune
                  /./!d;'
}

function load_binds_table() {
    table=$1
    # Merge binds with personal
    local binds=$(jq -s ".[1].$table + .[0].$table" <(jsonc_to_json $TMUX_PATH/conf/binds.jsonc) <(jsonc_to_json $TMUX_PATH/personal/binds.jsonc))
    echo "------- $table ---------"

    echo "$binds" | jq -r 'keys[] as $key | "\($key)\n\(.[$key])"' | while read key; do
        read cmd_raw

        # echo $key
        cmd=$(echo $cmd_raw | jq -r 'if type == "array" then join(" ") else . end' 2> /dev/null)
        if [ $? -ne 0 ]; then
            cmd=$cmd_raw
        fi
        # echo $cmd

        # echo "tmux bind -T $table $key \"$cmd\""
        tmux bind -T $table $key "$cmd"

        echo "---"
    done
}

function load_binds() {
    load_binds_table root
    load_binds_table prefix
    load_binds_table suspended
}

if [ "$#" -ge 1 ]; then
    func=$1
    shift
    $func $@
fi
