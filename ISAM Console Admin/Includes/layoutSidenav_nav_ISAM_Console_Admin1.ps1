
nav -Class "sidenav shadow-right sidenav-light" {
    Div -Class "sidenav-menu" {
        Div -Class "nav accordion" -id "accordionSidenav" {
            # Sidenav Menu Heading (Account)
            # * * Observação: * * Visível apenas em e acima do ponto de interrupção sm
            Div -Class "sidenav-menu-heading d-sm-none" { "Conta" }
            # Sidenav Link (Alerts)
            # * * Observação: * * Visível apenas em e acima do ponto de interrupção sm
            a -Class "nav-link d-sm-none" -href "#!" {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="bell"} }
                "Alertas"
                span -Class "badge bg-warning-soft text-warning ms-auto" { "4 Novo!" }
            }
            # Sidenav Link (Messages)
            # * * Observação: * * Visible only on and above the sm breakpoint
            a -Class "nav-link d-sm-none" -href "#!" {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="mail"} }
                "Mensagens"
                span -Class "badge bg-success-soft text-success ms-auto" { "2 Novo!" }
            }
            # Sidenav Menu Heading (Inicio)
            Div -Class "sidenav-menu-heading" { "Inicio" }
            # Sidenav Accordion (Dashboard)
            a -Class "nav-link" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseDashboards";"aria-expanded"="false";"aria-controls"="collapseDashboards" } {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="activity";"style"="font-weight: bold;" } }
                "Dashboards"
                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } 
            }
            Div -Class "collapse" -Id "collapseDashboards" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                nav -Class "sidenav-menu-nested nav accordion" -Id "accordionSidenavPages" {
                    a -Class "nav-link active" -href "dashboard-1.html" {
                        "Appliances"
                        span -Class "badge bg-primary-soft text-primary ms-auto" { "Principal" }
                    }
                    a -Class "nav-link" -href "dashboard-2.html" { "Proxy Reverso" }
                    a -Class "nav-link" -href "dashboard-3.html" { "Certificados" }
                }
            }
            # Cabeçalho do Sidenav (Gerenciamento)
            Div -Class "sidenav-menu-heading" {"Gerenciamento"}
            # Acordeão Sidenav (Monitor)
            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseMonitor";"aria-expanded"="false";"aria-controls"="collapseMonitor" } {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="grid"} }
                "Monitor"
                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } 
            }
            Div -Class "collapse" -id "collapseMonitor" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavPagesMenu" {
                    # Acordeão Sidenav aninhado (Monitor -> Logs)
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#monitorCollapseLogs";"aria-expanded"="false";"aria-controls"="monitorCollapseLogs" } {
                        "Logs"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                    }
                    Div -Class "collapse" -Id "monitorCollapseLogs" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "account-profile.html" { "Event Log" }
                            a -Class "nav-link" -href "account-billing.html" { "Manage Reverse Proxy Log Files" }
                            a -Class "nav-link" -href "account-security.html" { "Application Log Files" }
                            a -Class "nav-link" -href "user-management-list.html" { "Remote Syslog Forwarding" }
                        }
                    }
                    # Acordeão Sidenav Aninhado (Monitor -> Snapshots)
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#MonitorCollapseSnapshots";"aria-expanded"="false";"aria-controls"="MonitorCollapseSnapshots" } {
                        "Snapshots"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                    }
                    Div -Class "collapse" -id "monitorCollapseSnapshots" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                        nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavPagesAuth" {
                            # Acordeão Sidenav aninhado (Monitor -> Snapshots -> Gerenciamento)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#MonitorCollapseGerenciamento";"aria-expanded"="false";"aria-controls"="MonitorCollapseGerenciamento" } {
                                "Gerenciamento"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                            }
                            Div -Class "collapse" -id "MonitorCollapseGerenciamento" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesAuth" } {
                                nav -Class "sidenav-menu-nested nav" {
                                    a -Class "nav-link" -href "Gerenciamento-login-basic.html" { "Login" }
                                    a -Class "nav-link" -href "Gerenciamento-register-basic.html" { "Registro" }
                                    a -Class "nav-link" -href "Gerenciamento-password-basic.html" { "Esqueceu sua senha" }
                                }
                            }
                            ## Acordeão Sidenav aninhado (Monitor -> Autenticação -> Social)
                            #a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAuthSocial";"aria-expanded"="false";"aria-controls"="pagesCollapseAuthSocial" } {
                            #    "Social"
                            #    Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                            #}
                            #Div -Class "collapse" -id "pagesCollapseAuthSocial" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                            #    nav -Class "sidenav-menu-nested nav" {
                            #        a -Class "nav-link" -href "auth-login-social.html" { "Login" }
                            #        a -Class "nav-link" -href "auth-register-social.html" { "Registro" }
                            #        a -Class "nav-link" -href "auth-password-social.html" { "Esqueceu sua senha" }
                            #    }
                            #}
                        }
                    }
                    ## Acordeão Sidenav Aninhado (Monitor -> Erro)
                    #a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseError";"aria-expanded"="false";"aria-controls"="pagesCollapseError" } {
                    #    "Erro"
                    #    Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                    #}
                    #Div -Class "collapse" -id "pagesCollapseError" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                    #    nav -Class "sidenav-menu-nested nav" {
                    #        a -Class "nav-link" -href "error-400.html" { "400 Error" }
                    #        a -Class "nav-link" -href "error-401.html" { "401 Error" }
                    #        a -Class "nav-link" -href "error-403.html" { "403 Error" }
                    #        a -Class "nav-link" -href "error-404-1.html" { "404 Error 1" }
                    #        a -Class "nav-link" -href "error-404-2.html" { "404 Error 2" }
                    #        a -Class "nav-link" -href "error-500.html" { "500 Error" }
                    #        a -Class "nav-link" -href "error-503.html" { "503 Error" }
                    #        a -Class "nav-link" -href "error-504.html" { "504 Error" }
                    #    }
                    #}
                    #a -Class "nav-link" -href "pricing.html" { "Preços" }
                    #a -Class "nav-link" -href "invoice.html" { "Fatura" }
                }
            }
            # Sidenav Accordion (Web)
            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseWeb";"aria-expanded"="false";"aria-controls"="collapseWeb" } {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="globe"} } 
                "Web"
                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" } 
            }
            Div -Class "collapse" -id "collapseWeb" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavAppsMenu" {
                    # Nested Sidenav Accordion (Web -> Manage) 
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#WebCollapseManage";"aria-expanded"="false";"aria-controls"="WebCollapseManage" } {
                        "Manage"
                        Div -Class "sidenav-collapse-arrow" { i -class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "WebCollapseManage" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "Manage-Runtime-Component.html" { "Runtime Component" }
                            a -Class "nav-link" -href "Manage-base-home-1.html" { "Proxy Reverso" }
                            a -Class "nav-link" -href "Manage-base-category.html" { "Authorization Server" }
                            a -Class "nav-link" -href "Manage-base-article.html" { "Distributed Session Cache" }
                            a -Class "nav-link" -href "Manage-base-article.html" { "Policy Administration" }
                        }
                    }
                    # Nested Sidenav Accordion (Web -> Global Settings) 
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#WebCollapseGlobalSettings";"aria-expanded"="false";"aria-controls"="WebCollapseGlobalSettings" } {
                        "Global Settings"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "WebCollapseGlobalSettings" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "user-management-Autorizacoes.html" { "Gerenciamento de autorizações" }
                            a -Class "nav-link" -href "user-management-edit-user.html" { "Usuário" }
                            a -Class "nav-link" -href "user-management-list.html" { "Lista de usuários" }
                            a -Class "nav-link" -href "account-security.html" { "Grupos" }
                            a -Class "nav-link" -href "user-management-groups-list.html" { "Lista de grupos" }
                            a -Class "nav-link" -href "user-management-org-details.html" { "Detalhes da organização" }
                        }
                    }
                    # Nested Sidenav Accordion (Web -> Global Keys) 
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#WebCollapseGlobalKeys";"aria-expanded"="false";"aria-controls"="WebCollapseGlobalKeys" } {
                        "Global Keys"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "WebCollapseGlobalKeys" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "blog-management-posts-list.html" { "SSO Keys" }
                            a -Class "nav-link" -href "blog-management-create-post.html" { "LTPA Keys" }
                        }
                    }
                    # Nested Sidenav Accordion (Web -> API Access Control) 
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#WebCollapseAPIAccessControl";"aria-expanded"="false";"aria-controls"="WebCollapseAPIAccessControl" } {
                        "API Access Control"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "WebCollapseAPIAccessControl" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "blog-management-posts-list.html" { "Resources" }
                            a -Class "nav-link" -href "blog-management-create-post.html" { "Policies" }
                            a -Class "nav-link" -href "blog-management-create-post.html" { "CORS Policies" }
                        }
                    }

                }
            }
            # Sidenav Accordion (System)
            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseSystem";"aria-expanded"="false";"aria-controls"="collapseSystem" } {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="repeat"} } 
                "System"
                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            }
            Div -Class "collapse" -id "collapseSystem" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavAppsMenu" {
                    # Nested Sidenav Accordion (System -> Updates and Licensing)                   
                    a -Class "nav-link" -href "selecao_multipla.html" { "Updates and Licensing" }
                    # Nested Sidenav Accordion (System -> Network Settings)
                    a -Class "nav-link" -href "Assistente.html" { "Network Settings" }
                    # Nested Sidenav Accordion (System -> System Settings)
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#SystemCollapseSystemSettings";"aria-expanded"="false";"aria-controls"="SystemCollapseSystemSettings" } {
                        "System Settings"
                        Div -Class "sidenav-collapse-arrow" { i -class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "SystemCollapseSystemSettings" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "blog-management-posts-admin.html" { "Account Management" }
                            a -Class "nav-link" -href "blog-management-posts-list.html" { "Snapshots" }
                            a -Class "nav-link" -href "blog-management-create-post.html" { "Support Files" }
                            a -Class "nav-link" -href "blog-management-edit-post.html" { "System Alerts" }
                        }
                    }
                    # Nested Sidenav Accordion (System -> Secure Settings)
                    a -Class "nav-link" -href "Assistente.html" { "Secure Settings" }
                }
            }
            # Cabeçalho do Sidenav (Batch)
            Div -Class "sidenav-menu-heading" { "Processos em Lote" }
            # Sidenav Accordion (Batch)
            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseBatches";"aria-expanded"="false";"aria-controls"="collapseBatches" } {
                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="layout"} } 
                "Batch"
                Div -Class "sidenav-collapse-arrow" { i -class "fas fa-angle-down" }
            }
            Div -Class "collapse" -id "collapseBatches" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavLayout" {
                    # Nested Sidenav Accordion (Batch -> Coletores)
                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#BatchCollapseColetores";"aria-expanded"="false";"aria-controls"="BatchCollapseColetores" } {
                        "Coletores"
                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                    }
                    Div -Class "collapse" -id "BatchCollapseColetores" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
                        nav -Class "sidenav-menu-nested nav" {
                            a -Class "nav-link" -href "layout-static.html" { "Metricas dos Appliances" }
                            a -Class "nav-link" -href "layout-dark.html" { "Metricas dos Proxy Reversos" }
                            a -Class "nav-link" -href "layout-rtl.html" { "Metricas das Junctions" }
                        }
                    }
            #        # Nested Sidenav Accordion (Layout -> Container Options)
            #        a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutContainers";"aria-expanded"="false";"aria-controls"="collapseLayoutContainers" } {
            #            "Opções de contêiner"
            #            Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            #        }
            #        Div -Class "collapse" -id "collapseLayoutContainers" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
            #            nav -Class "sidenav-menu-nested nav" {
            #                a -Class "nav-link" -href "layout-boxed.html" {"Layout em caixa"}
            #                a -Class "nav-link" -href "layout-fluid.html" {"Layout Fluido"}
            #            }
            #        }
            #        # Nested Sidenav Accordion (Layout -> Page Headers)
            #        a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutsPageHeaders";"aria-expanded"="false";"aria-controls"="collapseLayoutsPageHeaders" } {
            #            "Cabeçalhos de página"
            #            Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            #        }
            #        Div -Class "collapse" -Id "collapseLayoutsPageHeaders" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
            #            nav -Class "sidenav-menu-nested nav" {
            #                a -Class "nav-link" -href "header-simplified.html" {"Simplificado"}
            #                a -Class "nav-link" -href "header-compact.html" {"Compactar"}
            #                a -Class "nav-link" -href "header-overlap.html" {"Sobreposição de conteúdo"}
            #                a -Class "nav-link" -href "header-breadcrumbs.html" {"Migalhas de pão"}
            #                a -Class "nav-link" -href "header-light.html" {"Leve"}
            #            }
            #        }
            #        # Nested Sidenav Accordion (Layout -> Starter Layouts)
            #        a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutsStarterTemplates";"aria-expanded"="false";"aria-controls"="collapseLayoutsStarterTemplates" } {
            #            "Layouts iniciais"
            #            Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            #        }
            #        Div -Class "collapse" -id "collapseLayoutsStarterTemplates"-Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
            #            nav -Class "sidenav-menu-nested nav" {
            #                a -Class "nav-link" -href "starter-default.html" { "Predefinição" }
            #                a -Class "nav-link" -href "starter-minimal.html" { "Mínimo" }
            #            }
            #        }
                }
            }
            ## Sidenav Accordion (Components)
            #a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseComponents";"aria-expanded"="false";"aria-controls"="collapseComponents" } {
            #    Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="package"} }
            #    "Componentes"
            #    Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            #}
            #Div -Class "collapse" -id "collapseComponents" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
            #    nav -Class "sidenav-menu-nested nav" {
            #        a -Class "nav-link" -href "alerts.html" {"Alertas"}
            #        a -Class "nav-link" -href "avatars.html" {"Avatares"}
            #        a -Class "nav-link" -href "badges.html" {"Distintivos"}
            #        a -Class "nav-link" -href "buttons.html" {"Botões"}
            #        a -Class "nav-link" -href "cards.html" {
            #            "Cartões"
            #            span -Class "badge bg-primary-soft text-primary ms-auto" {"Atualizado"}
            #        }
            #        a -Class "nav-link" -href "dropdowns.html" {"Listas suspensas"}
            #        a -Class "nav-link" -href "forms.html" {
            #            "Formulários"
            #            span -Class "badge bg-primary-soft text-primary ms-auto" { "Atualizado" }
            #        }
            #        a -Class "nav-link" -href "modals.html" {"Modais"}
            #        a -Class "nav-link" -href "navigation.html" {"Navegação"}
            #        a -Class "nav-link" -href "progress.html" {"Progresso"}
            #        a -Class "nav-link" -href "step.html" {"Etapa"}
            #        a -Class "nav-link" -href "timeline.html" {"Linha do tempo"}
            #        a -Class "nav-link" -href "toasts.html" {"Torradas"}
            #        a -Class "nav-link" -href "tooltips.html" {"Dicas de ferramentas"}
            #    }
            #}
            ## Sidenav Accordion (Utilities)
            #a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseUtilities";"aria-expanded"="false";"aria-controls"="collapseUtilities" } {
            #    Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="tool"} }
            #    "Utilitários"
            #    Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
            #}
            #Div -Class "collapse" -id "collapseUtilities" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
            #    nav -Class "sidenav-menu-nested nav" {
            #        a -Class "nav-link" -href "animations.html" {"Animações"}
            #        a -Class "nav-link" -href "background.html" {"Fundo"}
            #        a -Class "nav-link" -href "borders.html" {"Bordas"}
            #        a -Class "nav-link" -href "lift.html" {"Elevado"}
            #        a -Class "nav-link" -href "shadows.html" {"Sombras"}
            #        a -Class "nav-link" -href "typography.html" {"Tipografia"}
            #    }
            #}
            ## Sidenav Heading (Addons)
            #Div -Class "sidenav-menu-heading" { "Plug-ins" }
            ## Sidenav Link (Charts)
            #a -Class "nav-link" -href "charts.html" {
            #    Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="bar-chart"} }
            #    "Gráficos"
            #}
            ## Sidenav Link (Tables)
            #a -Class "nav-link" -href "tables.html" {
            #    Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="filter"} }
            #    "Tabelas"
            #}

        }
    }
    # Sidenav Footer
    Div -Class "sidenav-footer" {
        Div -Class "sidenav-footer-content" {
            Div -Class "sidenav-footer-subtitle" { "logado como:" }
            Div -Class "sidenav-footer-title" { "Alessandro Sabino" }
        }
    }

}
   
