# VSCode
# Shortcut ctrl+backspace is somehow mapped to ctrl+w in vscode integrated terminal (possibly a bug) and now we need to set ctrl+w binding to delete the word explicitly.
# https://stackoverflow.com/a/59125287/10369378
if ($env:TERM_PROGRAM -eq "vscode") {
    Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
}

# Starship
# $ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
# Invoke-Expression (&starship init powershell)

# OhMyPosh
Invoke-Expression (&oh-my-posh init pwsh --config ~/.config/ohmyposh/ohmyposh.json)

# Clear Promt
# This is to prevent some weird artifacts that shows on startup
Clear-Host

# Enable Intellisense Prediction
Set-PSReadLineOption -PredictionSource History
