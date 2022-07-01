Import-Module PSHTML -Force

# Definições de variáveis locais
$Path_ApplianceServers= Join-Path $PSScriptRoot "\Config\Appliances_Servers.json"          # Arquivo de Configurações dos Appliances
$Path_ApplianceMetrics= "C:\ISAM_UTIL\Prometheus\Log\ISAM_Metrics_Appliances_Coletor.json" # Arquivo de Metricas dos Appliances
$Path_JunctionsMetrics= "C:\ISAM_UTIL\Prometheus\Log\ISAM_Metrics_Junctions_Coletor.json"  # Arquivo de Metricas das Junctions

# Se arquivo não existe, não é possível começar
if (Get-Item -Path $Path_ApplianceServers -ErrorAction Ignore) {
    # Carrega lista de Appliances
    $ApplianceServers = Get-Content -Raw -Path $Path_ApplianceServers | ConvertFrom-Json
} else {
    Write-Output "O arquivo de Config dos Appliances não existia no caminho -> $Path_ApplianceServers"
    # Criar Arquivo Modelo de Config dos Appliances
    try {
        New-Item -Path $Path_ApplianceServers -ItemType File -Force -ErrorAction Stop 
        Add-Content $Path_ApplianceServers "{"
        Add-Content $Path_ApplianceServers "`t'Ambiente':'Producao',"
        Add-Content $Path_ApplianceServers "`t'Appliances':"
        Add-Content $Path_ApplianceServers "`t["
        Add-Content $Path_ApplianceServers "`t`t{'hostname':'acxxp3115cld.itau', 'IP':'10.225.48.102', 'service':'Webseal', 'rede':'CTMM1 - Corporativa'},"
        Add-Content $Path_ApplianceServers "`t`t{'hostname':'acxxp3116cld.itau', 'IP':'10.225.48.108', 'service':'Webseal', 'rede':'CTMM1 - Corporativa'}"
	    Add-Content $Path_ApplianceServers "`t]"
		Add-Content $Path_ApplianceServers "}"
        Write-Output "O arquivo modelo de Config dos Appliances foi criado. Atualizar o arquivo com os demais servidores do Appliance ISAM."
        Write-LogInfo -LogPath $File_Logs -Message "O arquivo modelo de Config dos Appliances foi criado. Atualizar o arquivo com os demais servidores do Appliance ISAM."
    } catch {
        Write-Output $_.Exception.Message
    }
}

if (Get-Item -Path $Path_ApplianceMetrics -ErrorAction Ignore) {
    # Carrega os dados das metricas de Appliances
    $ApplianceMetrics = Get-Content -Path $Path_ApplianceMetrics | ConvertFrom-Json
} else {
    Write-Host "Arquivo ApplianceMetrics não existe!"    
}

if (Get-Item -Path $Path_JunctionsMetrics -ErrorAction Ignore) {
    # Carrega os dados das metricas de Appliances
    $JunctionsMetrics = Get-Content -Path $Path_JunctionsMetrics | ConvertFrom-Json
} else {
    Write-Host "Arquivo JunctionMetrics não existe!"    
}

$HTMLPage = doctype
$HTMLPage += html -Attributes @{"lang"="pt-br"} {
    head {
        meta -charset "utf-8"
        meta -Attributes @{"http-equiv"="X-UA-Compatible"} -content_tag "IE=edge"
        meta -name "description" -content_tag ""
        meta -name "author" -content_tag ""
        meta -name "viewport" -content_tag "width=device-width, initial-scale=1, shrink-to-fit=no"
        Title { "ISAM Console" }
        Link -rel stylesheet -href "css/style.css"
        Link -rel stylesheet -href "css/styles.css"
        Link -rel stylesheet -href "css/bootstrap-icons.css"
        script -src "js/all.min.js"
        #script -type text/javascript -src "js/datatables/datatables-custom.js"
        #Write-PSHTMLAsset -Name Chartjs
    }

    body -Class "nav-fixed" -Attributes @{ "cz-shortcut-listen"="true" } { 
        # Ini Nav
        Include -Name topnav_ISAM_Console_Admin1
        # Fim Nav
       
        # Menu
        Div -Id "layoutSidenav" {
            Div -id "layoutSidenav_nav" {
                # Ini Menu
                include -Name layoutSidenav_nav_ISAM_Console_Admin1
                # Fim Menu
            }
        
            Div -id "layoutSidenav_content" {
                # Ini Principal
                Div -Id "Main" {
                    # Ini do Cabeçalho
                    header -Class "page-header page-header-dark bg-gradient-primary-to-secondary pb-10" {
                        Div -Class "container-xl px-4" {
                            Div -Class "page-header-content pt-4" {
                                Div -Class "row align-items-center justify-content-between" {
                                    Div -Class "col-auto mt-4" {
                                        h1 -Class "page-header-title" {
                                            Div -Class "page-header-icon" { i -Attributes @{"data-feather"="activity"} }
                                            "Dashboard"
                                        }
                                        Div -Class "page-header-subtitle" { "Simplifique a administração dos appliances navegando pela ISAM console de administração. Obtenha informações de todos os appliances e seus componentes de um único local." } -Style "max-width: 40rem"
                                    }
                                    Div -Class "col-12 col-xl-auto mt-4" {
                                        Div -Class "input-group input-group-joined border-0" -Attributes @{ "Style"="width: 16.5rem"} {
                                            span -Class "input-group-text" { i -Attributes @{"data-feather"="calendar" } } 
                                            input -id "litepickerRangePlugin" -name "selectDate" -type "text" -Class "form-control ps-0 pointer" -Attributes @{ "placeholder"="Selecione o intervalo de datas..." }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    # Fim do Cabeçalho
                    # Ini Conteúdo da página principal
                    Div -Class "container-xl px-4 mt-n10" {
                        # INI DataTable dos Applainces
                        Div -class "card mb-4" {
                            Div -Class "card-header" {"Gestão de Appliances"}
                            Div -Class "card-body" {
                                Table -id "datatablesSimple" -Class "display" -Style "width:100%" {
                                    Thead {
                                        tr { 
                                            Th {"Status"}
                                            Th {"Versão"}
                                            Th {"Ambiente"}
                                            Th {"IP"}
                                            Th {"Hostname"}
                                            Th {"Service"}
                                            Th {"Rede"}
                                            Th {"Partição P1"}
                                            Th {"Nome P1"}
                                            Th {"Versão do Firmware P1"}
                                            Th {"Data Instalação P1"}
                                            Th {"Tipo Instalação P1"}
                                            Th {"Data Último Boot P1"}
                                            Th {"Partição P2"}
                                            Th {"Nome P2"}
                                            Th {"Versão do Firmware P2"}
                                            Th {"Data Instalação P2"}
                                            Th {"Tipo Instalação P2"}
                                            Th {"Data Último Boot P2"}
                                            Th {"Ações"}
                                        }
                                    }
                                    tbody {
                                        try {
                                            # Carrega lista de Appliances
                                            foreach($versoes in $ApplianceServers.ISAM_Appliances) {
                                                foreach($ambientes in $versoes.Ambiente) {
                                                    #$AppliancesList = $ambientes.Appliances | Where-Object {$_.Service -notmatch "Policy Server|ISDS"} # filtra os appliances de Proxy Reverse
                                                    $AppliancesList = $ambientes.Appliances
                                                    $i = 0

                                                    foreach($Appliance in $AppliancesList) {
                                                        $AppMetrics = $ApplianceMetrics | Where-Object {$_.appliaIP -eq $Appliance.IP} | Select-Object -First 1
                                                        $JunMetrics = $JunctionsMetrics | Where-Object {$_.appliaIP -eq $Appliance.IP} | Select-Object -First 1
                                                        # Partiçao 1
                                                        $DtUltBootP1 = Test-ISAMTimeStamp -TimeStamp $AppMetrics.appParLB1
                                                        $DtInstallP1 = Test-ISAMTimeStamp -TimeStamp $AppMetrics.appParIDt1
                                                        # Partiçao 2
                                                        $DtUltBootP2 = Test-ISAMTimeStamp -TimeStamp $AppMetrics.appParLB2
                                                        $DtInstallP2 = Test-ISAMTimeStamp -TimeStamp $AppMetrics.appParIDt2

                                                        $href = $Appliance.href
                                                        switch ($Appliance.active) 
                                                        {
                                                            'True'    {$bgStatus = 'bg-success'; $bgText = 'Ativo'}
                                                            'Warning' {$bgStatus = 'bg-warning'; $bgText = 'Alerta'}
                                                            'False'   {$bgStatus = 'bg-danger' ; $bgText = 'Inativo'}
                                                        } 
                                                        tr {
                                                            td {Div -Class "badge rounded-pill $bgStatus text-white " "$bgText"}; 
                                                            td $versoes.Versao; 
                                                            td $ambientes.Tipo; 
                                                            td {a -Class "nav-link" -Target "_blank" -Attributes @{"rel"="noopener noreferrer"} -href "$href" {$Appliance.IP}}; 
                                                            td $Appliance.Hostname; 
                                                            td $Appliance.service; 
                                                            td $Appliance.rede; 
                                                            td $AppMetrics.appParti1;
                                                            td $AppMetrics.appParNme1;
                                                            td $AppMetrics.appParFwV1;
                                                            td $DtInstallP1;
                                                            td $AppMetrics.appParITp1;
                                                            td $DtUltBootP1;
                                                            td $AppMetrics.appParti2;
                                                            td $AppMetrics.appParNme2;
                                                            td $AppMetrics.appParFwV2;
                                                            td $DtInstallP2;
                                                            td $Appliance.appParITp2;
                                                            td $DtUltBootP2;
                                                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };}
                                                        }
                                                    }
                                                }
                                            }
                                        } catch {
                                            #$Message = ("[{0} - {1}]" -f (Get-Date -Format o), $_)
                                            #Write-LogError -LogPath $File_Logs -Message $Message -ExitGracefully
                                            throw $_.Exception.Message
                                            Exit
                                        }
                                    }
                                    tfoot {
                                        tr {
                                            Th {"Status"}
                                            Th {"Versão"}
                                            Th {"Ambiente"}
                                            Th {"IP"}
                                            Th {"Hostname"}
                                            Th {"Service"}
                                            Th {"Rede"}
                                            Th {"Partição P1"}
                                            Th {"Nome P1"}
                                            Th {"Versão do Firmware P1"}
                                            Th {"Data Instalação P1"}
                                            Th {"Tipo Instalação P1"}
                                            Th {"Data Último Boot P1"}
                                            Th {"Partição P2"}
                                            Th {"Nome P2"}
                                            Th {"Versão do Firmware P2"}
                                            Th {"Data Instalação P2"}
                                            Th {"Tipo Instalação P2"}
                                            Th {"Data Último Boot P2"}
                                            Th {"Ações"}
                                        }
                                    }
                                }
                            }
                        }
                        # FIM DataTable dos Applainces
                        
                        Div -Class "row" {
                            #Div -Class "col-xxl-4 col-xl-12 mb-4" {
                            #    Div -Class "card h-100" {
                            #        Div -Class "card-body h-100 p-5" {
                            #            Div -Class "row align-items-center" {
                            #                Div -Class "col-xl-8 col-xxl-12" {
                            #                    Div -Class "text-center text-xl-start text-xxl-center mb-4 mb-xl-0 mb-xxl-4" {
                            #                        h1 -Class "text-primary" { "Bem-vindo ao ISAM Console Admin" }
                            #                            p -Class "text-gray-700 mb-0" { "Simplifique a administração dos appliances navegando pela ISAM console de administração. Obtenha informações de todos os appliances e seus componentes de um único local." }
                            #                    }
                            #                }
                            #                Div -Class "col-xl-4 col-xxl-12 text-center" { img -Class "img-fluid" -src "./img/IBM_Security_Verify_Access.jpg" -Style "max-width: 20rem" } 
                            #            }
                            #        }
                            #    }
                            #}

                            Div -Class "col-xxl-4 col-xl-6 mb-4" {
                                Div -Class "card card-header-actions h-100" {
                                    Div -Class "card-header" {
                                        "Atividades recentes"
                                        Div -Class "dropdown no-caret" {
                                            button -Class "btn btn-transparent-dark btn-icon dropdown-toggle" -Id "dropdownMenuButton" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "text-gray-500" -Attributes @{"data-feather"="more-vertical"} } 
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{ "aria-labelledby"="dropdownMenuButton" } {
                                                h6 -Class "dropdown-header" { "Filtrar Atividade:" }
                                                    a -Class "dropdown-item" -href "#!" { span -Class "badge bg-green-soft text-green my-1" { "Comércio" } }
                                                    a -Class "dropdown-item" -href "#!" { span -Class "badge bg-blue-soft text-blue my-1" { "Comunicando" } }
                                                    a -Class "dropdown-item" -href "#!" { span -Class "badge bg-yellow-soft text-yellow my-1" { "Servidor" } }
                                                    a -Class "dropdown-item" -href "#!" { span -Class "badge bg-purple-soft text-purple my-1" { "Comercial" } }
                                            }
                                        }
                                    }
                                    Div -Class "card-body" {
                                        Div -Class "timeline timeline-xs" {
                                            # Timeline Item 1 
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" { "27 min" }
                                                    Div -Class "timeline-item-marker-indicator bg-green"
                                                }
                                                Div -Class "timeline-item-content" {
                                                    "Novo pedido feito!"
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" {" Pedido nº 2912 " }
                                                    "foi colocado com sucesso."
                                                }
                                            }
                                            # Timeline Item 2
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" {"58 min"}
                                                    Div -Class "timeline-item-marker-indicator bg-blue"
                                                }
                                                Div -Class "timeline-item-content" {
                                                    "Seu"
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" {" relatório semanal "}
                                                    "foi gerado e está pronto para visualização."
                                                }
                                            }
                                            # Timeline Item 3
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" {"2 horas"}
                                                    Div -Class "timeline-item-marker-indicator bg-purple" 
                                                }
                                                Div -Class "timeline-item-content" {
                                                    "Novo usuário"
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" { " Alessandro Sabino " }
                                                    "se registrou."
                                                }
                                            }
                                            # Timeline Item 4 
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" {"1 dia"}
                                                    Div -Class "timeline-item-marker-indicator bg-yellow" 
                                                }
                                                Div -Class "timeline-item-content" { "Alerta do monitor de atividade do servidor." }
                                            }
                                            # Timeline Item 5
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" {"1 dia"}
                                                    Div -Class "timeline-item-marker-indicator bg-green" 
                                                }
                                                Div -Class "timeline-item-content" {
                                                    { "Novo pedido feito!" }
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" { " Pedido nº 2911 " }
                                                    "foi colocado com sucesso."
                                                }
                                            }
                                            # Timeline Item 6
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                    Div -Class "timeline-item-marker-text" {"1 dia"}
                                                    Div -Class "timeline-item-marker-indicator bg-purple"
                                                }
                                                Div -Class "timeline-item-content" {
                                                    "Detalhes para"
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" { " Reunião de Marketing e Planejamento " }
                                                    "foram atualizados."
                                                }
                                            }
                                            # Timeline Item 7
                                            Div -Class "timeline-item" {
                                                Div -Class "timeline-item-marker" {
                                                        Div -Class "timeline-item-marker-text" {"2 dias"}
                                                        Div -Class "timeline-item-marker-indicator bg-green"
                                                }
                                                Div -Class "timeline-item-content" {
                                                    "Novo pedido feito!"
                                                    a -Class "fw-bold text-dark" -href "dashboard-1.html#!" {" Pedido nº 2910 "}
                                                    "foi colocado com sucesso."
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Div -Class "col-xxl-4 col-xl-6 mb-4" {
                                Div -Class "card card-header-actions h-100" {
                                    Div -Class "card-header" {
                                        "Rastreador de progresso"
                                        Div -Class "dropdown no-caret" {
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -id "dropdownMenuButton" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "text-gray-500" -Attributes @{"data-feather"="more-vertical"} }
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{"aria-labelledby"="dropdownMenuButton"} {
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "text-gray-500" -Attributes @{"data-feather"="list"} }
                                                    "Gerenciar tarefas" 
                                                }
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "text-gray-500" -Attributes @{"data-feather"="plus-circle"} }
                                                    "Adicionar nova tarefa"
                                                }
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "text-gray-500" -Attributes @{"data-feather"="minus-circle"} }
                                                    "Excluir tarefas"
                                                }
                                            }
                                        }
                                    }
                                    Div -Class "card-body" {
                                        h4 -Class "small" {
                                            "Migração do servidor"
                                            span -Class "float-end fw-bold" { "20%"}
                                        }
                                        Div -Class "progress mb-4" { Div -class "progress-bar bg-danger" -Attributes @{ "role"="progressbar";"style"="width: 20%";"aria-valuenow"="20";"aria-valuemin"="0";"aria-valuemax"="100" } }
                                        h4 -Class "small" {
                                            "Acompanhamento de vendas"
                                            span -Class "float-end fw-bold" {"40%"}
                                        }
                                        Div -Class "progress mb-4" { Div -Class "progress-bar bg-warning" -Attributes @{ "role"="progressbar";"style"="width: 40%";"aria-valuenow"="40";"aria-valuemin"="0";"aria-valuemax"="100" } }
                                        h4 -Class "small" {
                                            "Banco de dados do cliente"
                                            span -class "float-end fw-bold" {"60%"}
                                        }
                                        Div -Class "progress mb-4" { Div -Class "progress-bar" -Attributes @{"role"="progressbar";"style"="width: 60%";"aria-valuenow"="60";"aria-valuemin"="0";"aria-valuemax"="100" } }
                                        h4 -Class "small" {
                                            "Detalhes de pagamento"
                                            span -Class "float-end fw-bold" {"80%"}
                                        }
                                        Div -Class "progress mb-4" { Div -Class "progress-bar bg-info" -Attributes @{"role"="progressbar";"style"="width: 80%";"aria-valuenow"="80";"aria-valuemin"="0";"aria-valuemax"="100" } }
                                        h4 -Class "small" {
                                            "Configuração da conta"
                                            span -Class "float-end fw-bold" {"Complete!"}
                                        }
                                        Div -Class "progress" { Div -Class "progress-bar bg-success" -Attributes @{"role"="progressbar";"style"="width: 100%";"aria-valuenow"="100";"aria-valuemin"="0";"aria-valuemax"="100" } }
                                    }
                                    Div -Class "card-footer position-relative" {
                                        Div -Class "d-flex align-items-center justify-content-between small text-body" {
                                            a -Class "stretched-link text-body" -href "dashboard-1.html#!" {"Visite o Centro de Tarefas"}
                                            i -Class "fas fa-angle-right"
                                        }
                                    }
                                }
                            }
                        }
                        # INI Cartões Coloridos
                        Div -Class "row" {
                            Div -Class "col-lg-6 col-xl-3 mb-4" {
                                Div -Class "card bg-primary text-white h-100" {
                                    Div -Class "card-body" {
                                        div -Class "d-flex justify-content-between align-items-center" {
                                            div -Class "me-3" {
                                                div -Class "text-white-75 small" {"Ganhos (Mensal)"}
                                                div -Class "text-lg fw-bold" {"`$40,000"}
                                            }
                                            i -Class "feather-xl text-white-50" -Attributes @{"data-feather"="calendar"} 
                                        }
                                    }
                                    Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                            a -Class "text-white stretched-link" -href "dashboard-1.html#!" {"Ver relatório"}
                                        div -Class "text-white" { i -Class "fas fa-angle-right" }
                                    }
                                }
                            }
                            Div -Class "col-lg-6 col-xl-3 mb-4" {
                                Div -Class "card bg-warning text-white h-100" {
                                    Div -Class "card-body" {
                                        Div -Class "d-flex justify-content-between align-items-center" {
                                            Div -Class "me-3" {
                                                Div -Class "text-white-75 small" {"Ganhos (anual)"}
                                                Div -Class "text-lg fw-bold" {"`$215,000"}
                                            }
                                            i -class "feather-xl text-white-50" -Attributes @{"data-feather"="dollar-sign"}
                                        }
                                    }
                                    Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                            a -Class "text-white stretched-link" -href "dashboard-1.html#!" {"Ver relatório"}
                                        Div -Class "text-white" { i -class "fas fa-angle-right" }
                                    }
                                }
                            }
                            Div -class "col-lg-6 col-xl-3 mb-4" {
                                Div -Class "card bg-success text-white h-100" {
                                    Div -Class "card-body" {
                                        Div -Class "d-flex justify-content-between align-items-center" {
                                            Div -Class "me-3" {
                                                Div -Class "text-white-75 small" {"Conclusão da tarefa"}
                                                Div -Class "text-lg fw-bold" {"24"}
                                            }
                                            i -Class "feather-xl text-white-50" -Attributes @{"data-feather"="check-square"}
                                        }
                                    }
                                    Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                            a -Class "text-white stretched-link" -href "dashboard-1.html#!" {"Ver tarefas"}
                                        Div -Class "text-white" { i -class "fas fa-angle-right" }
                                    }
                                }
                            }
                            Div -Class "col-lg-6 col-xl-3 mb-4" {
                                Div -Class "card bg-danger text-white h-100" {
                                    Div -Class "card-body" {
                                        Div -Class "d-flex justify-content-between align-items-center" {
                                            Div -Class "me-3" {
                                                Div -Class "text-white-75 small" {"Solicitações Pendentes"}
                                                Div -Class "text-lg fw-bold" {"17"}
                                            }
                                            i -Class "feather-xl text-white-50" -Attributes @{"data-feather"="message-circle"}
                                        }
                                    }
                                    Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                            a -Class "text-white stretched-link" -href "dashboard-1.html#!" {"Visualizar solicitações"}
                                        Div -Class "text-white" { i -class "fas fa-angle-right" }
                                    }
                                }
                            }
                        }
                        # FIM Cartões Coloridos
                        # INI dos Gráficos do Dashboard 
                        Div -class "row" {
                            # INI Gráfico de Detalhamento
                            Div -Class "col-xl-6 mb-4" {
                                Div -Class "card card-header-actions h-100" {
                                    Div -Class "card-header" {
                                        " Detalhamento de Ganhos "
                                        Div -class "dropdown no-caret" {
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -id "areaChartDropdownExample" -Attributes @{ "type"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -class "text-gray-500" -Attributes @{"data-feather"="more-vertical"} }
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{ "aria-labelledby"="areaChartDropdownExample";"style"=""} {
                                                a -Class "dropdown-item" -href "dashboard-1.html#!" {"Últimos 12 meses"}
                                                a -Class "dropdown-item" -href "dashboard-1.html#!" {"Últimos 30 dias"}
                                                a -Class "dropdown-item" -href "dashboard-1.html#!" {"Últimos 7 dias"}
                                                a -Class "dropdown-item" -href "dashboard-1.html#!" {"Este mês"}
                                                div -Class "dropdown-divider"       
                                                a -Class "dropdown-item" -href "dashboard-1.html#!" {"Faixa personalizada"}
                                            }
                                        }
                                    }
                                    Div -Class "card-body" {
                                        Div -Class "chart-area" { 
                                            Div -Class "chartjs-size-monitor" { 
                                                Div -Class "chartjs-size-monitor-expand" { 
                                                    Div -class "" 
                                                } 
                                                Div -Class "chartjs-size-monitor-shrink" { 
                                                    Div -Class "" 
                                                } 
                                            } 
                                            canvas -Id "myAreaChart" -Width "429" -Height "240" -Style "display: block; width: 429px; height: 240px;" -class "chartjs-render-monitor" 
                                        }
                                    }
                                }
                            } # FIM Gráfico de Detalhamento
                            # INI Gráfico de Receita
                            Div -Class "col-xl-6 mb-4" {
                                Div -class "card card-header-actions h-100" {
                                    Div -Class "card-header" {
                                        "Espaço em disco"
                                        Div -Class "dropdown no-caret" {
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -Id "areaChartDropdownExample" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -class "text-gray-500" -Attributes @{"data-feather"="more-vertical"} }
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{ "aria-labelledby"="areaChartDropdownExample" } {
                                                a -Class "dropdown-item" -href "#!" {"Últimos 12 meses"}
                                                a -Class "dropdown-item" -href "#!" {"Últimos 30 dias"}
                                                a -Class "dropdown-item" -href "#!" {"Últimos 7 dias"}
                                                a -Class "dropdown-item" -href "#!" {"Este mês"}
                                                div -Class "dropdown-divider" 
                                                a -Class "dropdown-item" -href "#!" {"Faixa personalizada"}
                                            }
                                        }
                                    }
                                    Div -Class "card-body" {
                                        Div -Class "chart-bar" { 
                                            Div -Class "chartjs-size-monitor" { 
                                                Div -Class "chartjs-size-monitor-expand" {
                                                    Div -Class "" 
                                                }
                                                Div -class "chartjs-size-monitor-shrink" {
                                                    Div -Class "" 
                                                }
                                            }
                                            canvas -Id "myBarChart" -width "429" -Height "240" -Style "display: block; width: 429px; height: 240px;" -Class "chartjs-render-monitor" 
                                        }
                                    }
                                }
                            } # FIM Gráfico de Receita
                        } # FIM dos Gráficos do Dashboard
                    }
                    # Fim Conteúdo da página principal
                }
                # Fim Principal

                # Ini Footer
                include -Name content_Footer_ISAM_Console_Admin1
                # Fim Footer
            }
        }
        script -src "js/jquery-3.3.1.slim.min.js"
        script -src "js/bootstrap.bundle.min.js"
        script -src "js/scripts.js"
        script -src "js/chart.min.js" 
        script -src "js/chart-area-demo.js"
        script -src "js/chart-bar-demo.js"
        script -src "js/datatables-simple-demo.js"
        script -src "js/simple-datatables@latest.js"
        script -src "js/bundle.js"
        script -src "js/litepicker.js"
        script -src "js/sb-customizer.js"
        script -src "js/feather.min.js"
        #script -type text/javascript  -content "feather.replace();"
        #script -type text/javascript -src "BootStrap Exemplo/sb-admin-pro.startbootstrap.com/js/datatables/datatables-custom.js" 
        #script -type text/javascript -content "
        #    alert('Olá, Mundo!');
        #"
    }
}

$ScriptPath = Split-Path -Path $MyInvocation.MyCommand.Path
$ScriptPath = Split-Path -Path $PSScriptRoot
function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath
}
$ScriptPath = Get-ScriptDirectory

$path = Join-Path -Path $ScriptPath -ChildPath "\ISAM-Console.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path
