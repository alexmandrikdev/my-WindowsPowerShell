oh-my-posh init pwsh | Invoke-Expression

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -EditMode vi

# Git autocomplete
Import-Module posh-git

# Aliases
Set-Alias a PHP-ARTISAN

# Functions
function PHP-ARTISAN () {
    php artisan @args
}

function Install-Modules() {
    # For autocompletion
    Install-Module PSReadLine;

    # For git autocomplete
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
}

function Start-Processes() {
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

    $FilePaths = "D:\Programming\laragon\laragon.exe",
    "C:\Program Files\PowerToys\PowerToys.exe",
    # "C:\Users\Alex\AppData\Local\Programs\height-electron\Height.exe",
    # "C:\Users\Alex\AppData\Local\Programs\Microsoft VS Code\Code.exe",
    "D:\Program Files\PhpStorm 2023.3.4\bin\phpstorm64.exe",
    "C:\Program Files\Firefox Developer Edition\firefox.exe",
    "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe",
#    "C:\Users\Alex\AppData\Local\Grammarly\DesktopIntegrations\Grammarly.Desktop.exe",
    "C:\Program Files (x86)\QTranslate\QTranslate.exe",
    "C:\Program Files (x86)\Microsoft\Skype for Desktop\Skype.exe",
    "C:\Users\Alex\AppData\Roaming\Telegram Desktop\Telegram.exe",
    "C:\Program Files\Clockify\ClockifyWindows.exe"
    # "C:\Users\Alex\AppData\Local\Programs\Everhour Screenshots\Everhour Screenshots.exe"
    # "C:\Users\Alex\AppData\Local\slack\slack.exe"

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
