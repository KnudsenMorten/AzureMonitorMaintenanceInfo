$ServerInfo = @(
                    [PSCustomObject]@{
                                        ServerName = "MGMT01"
                                        MaintenanceModeActive = "False"
                                        Monitoring_WindowsServices = @(
                                                                        [PSCustomObject]@{
                                                                                            Type = "WindowsServices"
                                                                                            ServiceName = @("Kiwi","WindowsUpdate")
                                                                                         }
                                                                      )
                                     }
                    [PSCustomObject]@{
                                        ServerName = "MGMT02"
                                        MaintenanceModeActive = "True"
                                        Monitoring_WindowsServices = @(
                                                                        [PSCustomObject]@{
                                                                                            Type = "WindowsServices"
                                                                                            ServiceName = @("WindowsUpdate")
                                                                                         }
                                                                      )
                                     }
               )
$FileOutPut = $Env:OneDrive + "\Documents\GitHub\" + "AzureMonitorMaintenanceInfo" + "\" + "ServerMonitoring.json"
$JSON = $ServerInfo | ConvertTo-Json -Depth 20 | out-file $FileOutPut -Encoding utf8 -Force
