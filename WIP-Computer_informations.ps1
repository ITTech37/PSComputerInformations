# The main purpose of this script is to list the most important informations about your system.

######## Variables #######

$Stars = "**************************"

##########################

Switch($args[0])
{
    -s {
    Write-Host "Bonjour -s"
    }
    -d {
    Write-Host "Bonjour -d"
    }
    default{
        Write-Host ""
        Write-Host "Invalid argument. Please use one of the following arguments :"
        Write-Host ""
        Write-Host "-s : Display simplified hardware informations."
        Write-Host "-d : Display detailed hardware informations."
        Write-Host ""
    }
}

######## Version simplifiée ########

# CPU Informations #
Write-Host "************ CPU Informations ************"
Get-WmiObject Win32_Processor | Select-Object -Property Manufacturer,MaxClockSpeed,Name | Format-List
Write-Host $Stars
#

# RAM Informations #
Write-Host "************ RAM Informations ************"
Get-WmiObject Win32_PhysicalMemory | Select-Object -Property Capacity,ConfiguredClockSpeed,DeviceLocator,PartNumber | Format-List
Write-Host $Stars
#

# Disk Informations #
Write-Host "************ DISK Informations ************"
Get-WmiObject Win32_LogicalDisk | Select-Object Caption, VolumeName, FreeSpace, Size | Format-List
Get-WmiObject Win32_DiskDrive | Select-Object Model, InterfaceType, MediaType, SerialNumber | Format-List
Write-Host $Stars
#

# Networking Informations #
Write-Host "************ NETWORKING Informations ************"
Get-WmiObject Win32_NetworkAdapter | Select-Object Name, AdapterType, MACAddress, Speed | Format-List
Get-WmiObject Win32_NetworkAdapterConfiguration | Select-Object Description, IPAddress, DefaultIPGateway, DNSDomain, DHCPEnabled | Format-List
Write-Host $Stars
#

# BIOS Informations #
Write-Host "************ BIOS Informations ************"
Get-WmiObject Win32_BIOS | Select-Object -Property SMBIOSBIOSVersion, Manufacturer | Format-List
Write-Host $Stars
#

# OS Informations #
Write-Host "************ OS Informations ************"
Get-WmiObject Win32_OperatingSystem | Select-Object Version, BuildNumber, Organisation | Format-List
Write-Host $Stars
#

######## Version détaillée #########

# CPU Informations #
Get-WmiObject Win32_Processor

# RAM Informations #
Get-WmiObject Win32_PhysicalMemory

# Disk Informations #
Get-WmiObject Win32_LogicalDisk
Get-WmiObject Win32_DiskDrive

# Networking Informations #
Get-WmiObject Win32_NetworkAdapterConfiguration

# BIOS Informations #
Get-WmiObject Win32_BIOS

# OS Informations #
Get-WmiObject Win32_OperatingSystem