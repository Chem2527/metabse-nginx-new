## license key for new relic:
 ```bash
d2ba3124df66382abe2281f0057c230cFFFFNRAL
```
## new key:
```bash
 NRAK-JHO78BSDGARJZZ80RD7E9KLESGM
```
## Open powershell as admin and run below commands
```bash
[Net.ServicePointManager]::SecurityProtocol = 'tls12, tls'; $WebClient = New-Object System.Net.WebClient; $WebClient.DownloadFile("https://download.newrelic.com/install/newrelic-cli/scripts/install.ps1", "$env:TEMP\install.ps1"); & PowerShell.exe -ExecutionPolicy Bypass -File $env:TEMP\install.ps1; $env:NEW_RELIC_API_KEY='NRAK-JHO78BSDGARJZZ80RD7E9KLESGM'; $env:NEW_RELIC_ACCOUNT_ID='6358124'; & 'C:\Program Files\New Relic\New Relic CLI\newrelic.exe' install
```
```bash
<img width="697" alt="image" src="https://github.com/user-attachments/assets/8c0b6624-baf2-4b06-ac6c-534275f94fc5" />
```
