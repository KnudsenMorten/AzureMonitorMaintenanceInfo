$ServerInfo = @(
                    [PSCustomObject]@{
                                        ServerName = "MGMT01"
                                        MaintenanceModeActive = "False"
                                        Monitoring_WindowsServices = @(
                                                                        [PSCustomObject]@{
                                                                                            Type = "WindowsServices"
                                                                                            ServiceDisplayNameContains = @("Kiwi","WindowsUpdate")
                                                                                         }
                                                                      )
                                     }
                    [PSCustomObject]@{
                                        ServerName = "MGMT02"
                                        MaintenanceModeActive = "True"
                                        Monitoring_WindowsServices = @(
                                                                        [PSCustomObject]@{
                                                                                            Type = "WindowsServices"
                                                                                            ServiceDisplayNameContains = @("WindowsUpdate")
                                                                                         }
                                                                      )
                                     }
               )

$JSON = $ServerInfo | ConvertTo-Json -Depth 20 | out-file "C:\Users\mok\OneDrive - 2linkIT\Documents\GitHub\PowershellKnownMitigationsLib\ServerMonitoring.json" -Encoding utf8 -Force
