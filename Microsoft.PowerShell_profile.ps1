oh-my-posh init pwsh | Invoke-Expression

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# Aliases
Set-Alias a PHP-ARTISAN

# Functions
function PHP-ARTISAN ($P1, $P2, $P3, $P4, $P5, $P6) {
    php artisan $P1, $P2, $P3, $P4, $P5, $P6
}

function Install-ModulesForWork(){
    # For autocompletion
    Install-Module PSReadLine;
}
