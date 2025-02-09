#!/bin/bash
tm="$1"
tm_max="$2"
tm_arr=()
tm_arr_count=0
set -f
# Reparse input to array
spaced_tm=$(echo "$tm" | sed 's|*|* |g; s|/| / |g; s|:| : |g; s|~| ~ |g; s|-| - |g')
# Check if input is valid
# 1. If "  " is in input, it means no number between two signs
# 2. If " " is the first or the last character, it means no number after first/last sign
# 3. If character other than number and signs above is in input, it's invalid
if [ -z "$spaced_tm" ] || [ "${spaced_tm:0:1}" == " " ] ; then
    # Invalid entry
    echo "E 1"
    exit 1
fi
IFS=" " read -r -a _tm_input_arr <<< "${spaced_tm}"

i=0
len="${#_tm_input_arr[@]}"
if [ "$len" -eq 1 ]; then
    if [ "$tm" == "*" ]; then
        # Single * character, match all values, so return nothing
        # Return "0 15 30 45" for seconds because minimum interval is 15 seconds
        if [ "$tm_max" -eq 3 ]; then
            echo "0 15 30 45"
        fi
        exit 0
    # Check if it's a valid number
    elif ! [[ $tm =~ ^[0-9]+$ ]]; then
        # Invalid entry
        echo "E 2"
        exit 1
    fi
    tm_arr[0]="$tm"
else
    while [ "$i" -lt "$len" ]; do
        elm="${_tm_input_arr[$i]}"
        # Parse */<sep>
        if [ "$elm" == "*" ]; then
            # Elements after * must be /<sep>
            if [ "${_tm_input_arr[$i+1]}" != "/" ]; then
                # Invalid entry
                echo "E 3"
                exit 1
            fi
            # Extract separator and values
            sep="${_tm_input_arr[$i+2]}"
            # Generate values: 0*sep sep 2*sep ...
            count=$(("$tm_max" / "$sep"))
            # Days and months are beginning from 1
            if [ "$tm_max" -eq 31 ] || [ "$tm_max" -eq 12 ]; then
                base=1
            else
                base=0
                count=$((count + 1))
            fi
            for (( j = 0; j < count; j++ )); do
                tm_arr[j]="$(( j * sep + base ))"
            done
            break
        fi
        # Parse signs
        if [ "$elm" == ":" ]; then
            # Number elements before : is added to array
            elm1="${_tm_input_arr[$i-1]}"
            tm_arr[tm_arr_count]="$elm1"
            tm_arr_count=$((tm_arr_count + 1))
            i=$((i + 2))
            if [ "$i" -ge "$len" ]; then
                # Add last element
                tm_arr[tm_arr_count]="${_tm_input_arr[$i-1]}"
                tm_arr_count=$((tm_arr_count + 1))
            fi
            continue
        fi
        if [ "$elm" == "-" ]; then
            # Number elements between the range are added to array
            elm1="${_tm_input_arr[$i-1]}"
            elm2="${_tm_input_arr[$i+1]}"
            for (( j = elm1; j <= elm2; j++ )); do
                tm_arr[tm_arr_count]="$j"
                tm_arr_count=$((tm_arr_count + 1))
            done
            i=$((i + 2))
            continue
        fi
        if [ "$elm" == "~" ]; then
            # Number element after ~ is removed from array
            elm1="${_tm_input_arr[$i+1]}"
            # Find index of elm1
            for (( j = 0; j < "${#tm_arr[@]}"; j++ )); do
                if [ "${tm_arr[$j]}" == "$elm1" ]; then
                    unset 'tm_arr[$j]'
                    break
                fi
            done
            i=$((i + 2))
            continue
        fi
        # If element is not a number, error
        if ! [[ $elm =~ ^[0-9]+$ ]]; then
            # Invalid entry
            echo "E 4"
            exit 1
        fi
        i=$((i + 1))
    done
fi

# Process "seconds" specially because it's 15 seconds with range in 0-3
if [ "$tm_max" -eq 3 ]; then
    for (( j = 0; j <= ${#tm_arr[@]}; j++ )); do
        # Check if it's a number
        if [[ ${tm_arr[$j]} =~ ^[0-9]+$ ]]; then
            # Number * 15
            k="$(( ${tm_arr[$j]} * 15 ))"
            tm_arr[j]="$k"
        fi
    done
fi

# Remove duplicates
declare -A arr
for i in "${tm_arr[@]}"; do
    arr["$i"]="$i"
done
tm_arr=("${arr[@]}")

echo "${tm_arr[@]}"
