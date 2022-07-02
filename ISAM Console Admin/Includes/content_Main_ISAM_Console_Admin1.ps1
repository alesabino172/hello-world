
Div -Id "Main" {
    header -Class "page-header page-header-dark bg-gradient-primary-to-secondary pb-10" {
        Div -Class "container-xl px-4" {
            Div -Class "page-header-content pt-4" {
                Div -Class "row align-items-center justify-content-between" {
                    Div -Class "col-auto mt-4" {
                        h1 -Class "page-header-title" {
                            Div -Class "page-header-icon" { i -Attributes @{"data-feather"="activity"} }
                            "Dashboard"
                        }
                        Div -Class "page-header-subtitle" { "Exemplo de visão geral do painel e resumo de conteúdo" }
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
    # Main page content
    Div -Class "container-xl px-4 mt-n10" {
        Div -Class "row" {
            Div -Class "col-xxl-4 col-xl-12 mb-4" {
                Div -Class "card h-100" {
                    Div -Class "card-body h-100 p-5" {
                        Div -Class "row align-items-center" {
                            Div -Class "col-xl-8 col-xxl-12" {
                                Div -Class "text-center text-xl-start text-xxl-center mb-4 mb-xl-0 mb-xxl-4" {
                                    h1 -Class "text-primary" { "Bem-vindo ao ISAM Console Admin!" }
                                        p -Class "text-gray-700 mb-0" { "Navegue pelo nosso kit de ferramentas de interface do usuário totalmente projetado! Navegue por nossas páginas, componentes e utilitários de aplicativos pré-criados e certifique-se de consultar nossa documentação completa!" }
                                }
                            }
                            Div -Class "col-xl-4 col-xxl-12 text-center" { img -Class "img-fluid" -src "./img/illustrations/at-work.svg" -Style "max-width: 26rem" } 
                        }
                    }
                }
            }
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
        # Example Colored Cards for Dashboard Demo
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
        # Example Charts for Dashboard Demo
        Div -class "row" {
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
            }
            Div -Class "col-xl-6 mb-4" {
                Div -class "card card-header-actions h-100" {
                    Div -Class "card-header" {
                        "Receita mensal"
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
            }
        }
        # Example DataTable for Dashboard Demo
        Div -class "card mb-4" {
            Div -Class "card-header" {"Gestão de Pessoas"}
            Div -Class "card-body" {
                Table -id "datatablesSimple" -Class "display" -Style "width:100%" {
                    Thead {
                        tr { 
                            Th {"Nome"}
                            Th {"Posição"}
                            Th {"Escritório"}
                            Th {"Idade"}
                            Th {"Data de início"}
                            Th {"Salário"}
                            Th {"Status"}
                            Th {"Ações"}
                        }
                    }
                    tbody {
                        tr {
                            td "Tiger Nixon"; td "Arquiteto de Sistemas"; td "Edinburgh"; td "61"; td "2011/04/25"; td "`$320,800"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} }; 
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Garrett Winters"; td "Contador"; td "Tokyo"; td "63"; td "2011/07/25"; td "`$170,750"; td {Div -Class "badge bg-warning rounded-pill" "Pendente"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Ashton Cox"; td "Autor Técnico Júnior"; td "San Francisco"; td "66"; td "2009/01/12"; td "`$86,000"; td {Div -Class "badge bg-secondary text-white rounded-pill" "Tempo parcial"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Cedric Kelly"; td "Desenvolvedor Javascript Sênior"; td "Edinburgh"; td "22"; td "2012/03/29"; td "`$433,060"; td {Div -Class "badge bg-info rounded-pill" "Contrato"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Airi Satou"; td "Contador"; td "Tokyo"; td "33"; td "2008/11/28"; td "`$162,700"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Brielle Williamson"; td "Especialista em Integração"; td "New York"; td "61"; td "2012/12/02"; td "`$372,000"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Herrod Chandler"; td "Assistente de vendas"; td "San Francisco"; td "59"; td "2012/08/06"; td "`$137,500"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr { 
                            td "Rhona Davidson"; td "Especialista em Integração"; td "Tokyo"; td "55"; td "2010/10/14"; td "`$327,900"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Colleen Hurst"; td "Desenvolvedor Javascript"; td "San Francisco"; td "39"; td "2009/09/15"; td "`$205,500"; td {Div -Class "badge bg-info rounded-pill" "Contrato"};
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Sonya Frost"; td "Engenheiro de software"; td "Edinburgh"; td "23"; td "2008/12/13"; td "`$103,600"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Haley Kennedy"; td "Designer de Marketing Sênior"; td "London"; td "43"; td "2012/12/18"; td "`$313,500"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Cedric Kelly"; td "Designer de Marketing Sênior"; td "Edinburgh"; td "22"; td "2012/03/29"; td "`$433,060"; td {Div -Class "badge bg-primary text-white rounded-pill" "Contrato"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Hope Fuentes"; td "Secretária"; td "San Francisco"; td "41"; td "2010/02/12"; td "`$109,850"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Doris Wilder"; td "Assistente de vendas"; td "Sidney"; td "23"; td "2010/09/20"; td "`$85,600"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                        tr {
                            td "Herrod Chandler"; td "Assistente de vendas"; td "San Francisco"; td "59"; td "2012/08/06"; td "`$137,500"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                            td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Attributes @{"data-feather"="more-vertical"} };
                                button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Attributes @{"data-feather"="trash-2"} }}
                            };
                    }
                    tfoot {
                        tr {
                            Th {"Nome"}
                            Th {"Posição"}
                            Th {"Escritório"}
                            Th {"Idade"}
                            Th {"Data de início"}
                            Th {"Salário"}
                            Th {"Status"}
                            Th {"Ações"}
                        }
                    }
                }
            }
        }
    }
}
