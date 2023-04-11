#Requires -RunAsAdministrator

winget install -e --id 7zip.7zip
winget install -e --id Microsoft.PowerToys
winget install -e --id Nvidia.GeForceExperience
winget install -e --id Google.Chrome
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Notepad++.Notepad++
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Discord.Discord
winget install -e --id Spotify.Spotify
winget install -e --id Valve.Steam
winget install -e --id Microsoft.VisualStudio.2022.Community
winget install -e --id JetBrains.Toolbox
winget install -e --id OpenJS.NodeJS.LTS
npm install yarn --global
winget install -e --id Docker.DockerDesktop
winget install -e --id Python.Python.3.11

Restart-Computer