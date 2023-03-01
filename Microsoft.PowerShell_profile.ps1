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

function Install-ModulesForWork() {
    # For autocompletion
    Install-Module PSReadLine;
}

function Start-WorkProcesses() {
    function Get-FileName-From-Path($Path) {
        $Split = $Path.split("\\");

        $NameWithExtension = $Split[$Split.Count - 1];

        $Split = $NameWithExtension.split('.');

        $Name = $Split[0];

        for ($i = 1; $i -lt $Split.Count - 1; $i++) {
            $Name += "." + $Split[$i];
        }

        return $Name;
    }

    $TempFile = New-TemporaryFile;

    $FilePaths = "C:\laragon\laragon.exe",
        "C:\Program Files\PowerToys\PowerToys.exe",
        "C:\Users\Alex\AppData\Local\Programs\height-electron\Height.exe",
        "C:\Users\Alex\AppData\Local\Programs\Microsoft VS Code\Code.exe",
        "C:\Program Files\Firefox Developer Edition\firefox.exe",
        "C:\Users\Alex\AppData\Local\Grammarly\DesktopIntegrations\Grammarly.Desktop.exe",
        "C:\Program Files (x86)\QTranslate\QTranslate.exe",
        "C:\Program Files (x86)\Microsoft\Skype for Desktop\Skype.exe",
        "C:\Users\Alex\AppData\Roaming\Telegram Desktop\Telegram.exe",
        "C:\Users\Alex\AppData\Local\Programs\upwork\Upwork.exe"

    foreach ($FilePath in $FilePaths) {
        $ProcessName = Get-FileName-From-Path -Path $FilePath

        $Process = (Get-Process $ProcessName -ErrorAction SilentlyContinue)

        if ($Process) {
            echo ($ProcessName + " is already running");
        }
        else {
            echo ("Starting " + $ProcessName + "...");

            Start-Process -FilePath $FilePath -RedirectStandardOutput $TempFile;
        }
    }
}
