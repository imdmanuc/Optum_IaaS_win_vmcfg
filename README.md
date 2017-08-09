# Windows Post Configuration Cookbook (optum_iaas_win_vmcfg)

### Windows Post Configuration Cookbook
Introduction:
  Windows 2012 R2 Self/Full-Support Post Configuration Cookbook.

### List of what gets configured
Virtual Machine Post Configurations
  1. Windows Services
    - wuauserv (Windows Update) - Sets to Manual
    - NlaSvc (Network Location Awareness - Sets to Manual
    - browser (Computer Browser) - Sets to disable
    - BITS (Background Intelligent Transfer Service) - Sets to Manual
    - hidserv (Human Interface Device Access) - Sets to disable
    - PolicyAgent (IPsec Policy Agent Service) - Sets to Auto
    - pla (Performance Logs & Alerts) - Sets to Auto
    - Spooler (Print Spooler) - Sets to Manual
    - RasAuto (Remote Access Auto Connection Manager) - Sets to Auto
    - RasMan (Remote Access Auto Connection Manager) - Sets to Manual
    - TapiSrv (Telephony) - Sets to Manual
    - msiserver (Windows Installer) - Start service
  2. Boot Configuration Data Editor - Sets time to display list of OS to 5 seconds
  3. Sets hibernate off
  4. Set Day Light Saving
  5. Disables LUA

## Requirements

### Platforms

Windows Version                     
------------------------
Windows Server 2012 - Full/Self-Support                 
Windows Server 2012 R2 - Full/Self-Support

### Chef

- Chef 12.6+
