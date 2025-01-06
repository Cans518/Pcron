#!/bin/bash

# Sysroot base
ROOT=""

# Print log
logfile="$ROOT/var/log/pcron.log"
log() {
    # [date] script_name: message
    echo "[$(date -Iseconds)] $1: $2 " >> "$logfile"
}

# Verify time to execute

verifyTime(){
    time_now=$(date +"%-S %-M %-H %-d %-m %-w")
    time_s=$(echo "$time_now" | awk '{print $1}')
    time_m=$(echo "$time_now" | awk '{print $2}')
    time_h=$(echo "$time_now" | awk '{print $3}')
    time_d=$(echo "$time_now" | awk '{print $4}')
    time_mn=$(echo "$time_now" | awk '{print $5}')
    time_w=$(echo "$time_now" | awk '{print $6}')

    if [ -n "$seconds" ]; then
        found=0
        for (( j = 0; j < "${#seconds[@]}"; j++ )); do
            if [[ "$time_s" == "${seconds[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi

    if [ -n "$minutes" ]; then
        found=0
        for (( j = 0; j < "${#minutes[@]}"; j++ )); do
            if [[ $time_m == "${minutes[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi

    if [ -n "$hours" ]; then
        found=0
        for (( j = 0; j < "${#hours[@]}"; j++ )); do
            if [[ $time_h == "${hours[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi

    if [ -n "$days" ]; then
        found=0
        for (( j = 0; j < "${#days[@]}"; j++ )); do
            if [[ $time_d == "${days[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi

    if [ -n "$months" ]; then
        found=0
        for (( j = 0; j < "${#months[@]}"; j++ )); do
            if [[ $time_mn == "${months[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi

    if [ -n "$weeks" ]; then
        found=0
        for (( j = 0; j < "${#weeks[@]}"; j++ )); do
            if [[ $time_w == "${weeks[j]}" ]]; then
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            exit
        fi
    fi
}

checkPID() {
    # Check for PID file
    if [ -f "$pidfile" ]; then
        # Check if process is running
        if pgrep -F "$pidfile" >/dev/null; then
            log "runner" "Command $command: Process is already running"
            exit
        fi
    fi
    echo "$BASHPID" > "$pidfile"
}
