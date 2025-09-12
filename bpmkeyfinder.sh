#!/bin/bash

# ======================================================================
# Script to analyze BPM and Key of an audio file using Aubio
# ======================================================================

# Check if audio file was provided as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <audio_file_path>"
    exit 1
fi

AUDIO_FILE="$1"

# Check if file exists
if [ ! -f "$AUDIO_FILE" ]; then
    echo "Error: File '$AUDIO_FILE' not found."
    exit 1
fi

# ======================================================================
# 1. BPM Detection
# ======================================================================
BPM=$(aubio tempo "$AUDIO_FILE" 2>/dev/null | awk '{print $1}')
ROUNDED_BPM=$(printf "%.0f\n" "$BPM")

echo "BPM: $ROUNDED_BPM"

# ======================================================================
# 2. Key Detection
# ======================================================================

# MIDI note translation table to note names
declare -A MIDI_NOTES
MIDI_NOTES=(
    # Octave 3
    [48]="C3" [49]="C#3/Db3" [50]="D3" [51]="D#3/Eb3" [52]="E3" [53]="F3" [54]="F#3/Gb3" [55]="G3" [56]="G#3/Ab3" [57]="A3" [58]="A#3/Bb3" [59]="B3"
    # Octave 4 (Middle C = 60)
    [60]="C4" [61]="C#4/Db4" [62]="D4" [63]="D#4/Eb4" [64]="E4" [65]="F4" [66]="F#4/Gb4" [67]="G4" [68]="G#4/Ab4" [69]="A4" [70]="A#4/Bb4" [71]="B4"
    # Octave 5
    [72]="C5" [73]="C#5/Db5" [74]="D5" [75]="D#5/Eb5" [76]="E5" [77]="F5" [78]="F#5/Gb5" [79]="G5" [80]="G#5/Ab5" [81]="A5" [82]="A#5/Bb5" [83]="B5"
    # Octave 6
    [84]="C6" [85]="C#6/Db6" [86]="D6" [87]="D#6/Eb6" [88]="E6" [89]="F6" [90]="F#6/Gb6" [91]="G6" [92]="G#6/Ab6" [93]="A6" [94]="A#6/Bb6" [95]="B6"
)

# Analyze file, find most frequent MIDI note
MOST_FREQUENT_MIDI_NOTE=$(aubionotes -i "$AUDIO_FILE" 2>/dev/null | awk 'NF==3 {print int($1)}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

# Translate MIDI number to note name
ESTIMATED_KEY=${MIDI_NOTES[$MOST_FREQUENT_MIDI_NOTE]}

if [ -z "$ESTIMATED_KEY" ]; then
    echo "Could not determine key. Most common MIDI note is: $MOST_FREQUENT_MIDI_NOTE"
else
    echo "Key: $ESTIMATED_KEY"
fi
