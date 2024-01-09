# ACTION
terminal_font_big() {
  ~/.dotfiles/bin/alacritty-mod font-size 23
}

# ACTION
terminal_font_medium() {
  ~/.dotfiles/bin/alacritty-mod font-size 18
}

# ACTION
terminal_font_small() {
  ~/.dotfiles/bin/alacritty-mod font-size 13
}

# ACTION
pulseaudio_on() {
  ~/.dotfiles/bin/audio-control pulse_start
}

# ACTION
pulseaudio_off() {
  ~/.dotfiles/bin/audio-control pulse_stop
}

# ACTION
jack_on() {
  ~/.dotfiles/bin/audio-control jack_start
}

# ACTION
jack_off() {
  ~/.dotfiles/bin/audio-control jack_stop
}

# ACTION
audio_pro() {
  ~/.dotfiles/bin/audio-control pro_mode
}

# ACTION
audio_normal() {
  ~/.dotfiles/bin/audio-control normal_mode
}
