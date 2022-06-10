Import-Module PSHTML -Force

$HTMLPage = doctype
$HTMLPage += html -Class "fontawesome-i2svg-active fontawesome-i2svg-complete" -Attributes @{"lang"="pt-br" } {
    head {
        meta -charset "utf-8"
        meta -Attributes @{"http-equiv"="X-UA-Compatible"} -content_tag "IE=edge"
        meta -name "description" -content_tag ""
        meta -name "author" -content_tag ""
        meta -name "viewport" -content_tag "width=device-width, initial-scale=1, shrink-to-fit=no"
        Title { "ISAM Console" }
        #Link -rel stylesheet -href "css/all.min.css"
        Link -rel stylesheet -href "css/style.css"
        Link -rel stylesheet -href "css/styles2.css"
        Link -rel stylesheet -href "css/bootstrap-icons.css"
        #Link -rel stylesheet -href "css/fontawesome.min.css"
        script -src "js/all.min.js"
        #script -src "js/feather.min.js"
        Write-PSHTMLAsset -Name Jquery
        Write-PSHTMLAsset -Name Chartjs
    }

    body -Class "nav-fixed" -Attributes @{ "cz-shortcut-listen"="true" } { 
        nav -Class "topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" -id "sidenavAccordion" {
            # Sidenav Toggle Button
            button -Class "btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" -Id "sidebarToggle" { i -class "fa fa-bars" }
            # Navbar Brand
            # * * Tip * * You can use text or an image for your navbar brand.
            # * * * * * * When using an image, we recommend the SVG format.
            ## * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px
            a -Class "navbar-brand pe-3 ps-4 ps-lg-2" -href "index.html" { "SB Admin Pro" }
            # Navbar Search Input
            # * * Note: * * Visible only on and above the lg breakpoint
            Form -action "#" -Class "form-inline me-auto d-none d-lg-block me-3" -method post -Content {
                Div -Class "input-group input-group-joined input-group-solid" {
                    input -Class "form-control pe-0" -name "NavbarSearch" -type "search" -Attributes @{ "placeholder"="Search";"aria-label"="Search" }
                      Div -Class "input-group-text" { i -Class "fa fa-search" }
                }
            } -enctype "application/x-www-form-urlencoded" -target "_self"
            # Navbar Items
            ul -Class "navbar-nav align-items-center ms-auto" {
                # Documentation Dropdown
                li -Class "nav-item dropdown no-caret d-none d-md-block me-3" {
                    a -Class "nav-link dropdown-toggle" -Id "navbarDropdownDocs" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } {
                        Div -Class "fw-500" { "Documentação" }
                          i -Class "fas fa-chevron-right dropdown-arrow"
                    }
                    Div -Class "dropdown-menu dropdown-menu-end py-0 me-sm-n15 me-lg-0 o-hidden animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownDocs"; "data-bs-popper"="none" } {
                        a -Class "dropdown-item py-3" -href "https://docs.startbootstrap.com/sb-admin-pro" -Target "_blank" {
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Class "fa fa-book" } 
                            Div {
                                Div -Class "small text-gray-500" { "Documentação" }
                                " Instruções de uso e referência "
                            }
                        }
                        Div -Class "dropdown-divider m-0" 
                        a -Class "dropdown-item py-3" -href "https://docs.startbootstrap.com/sb-admin-pro/components" -Target "_blank" {
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Class "fa fa-code" }
                            Div {
                                Div -Class "small text-gray-500" { "Componentes" }
                                " Trechos de código e referência "
                            }
                        }
                        Div -Class "dropdown-divider m-0"
                        a -Class "dropdown-item py-3" -href "https://docs.startbootstrap.com/sb-admin-pro/changelog" -Target "_blank" {
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Class "bi bi-file-earmark-text" } 
                            Div {
                                Div -Class "small text-gray-500" { "Registro de alterações" }
                                " Atualizações e mudanças "
                            }
                        }
                    }
                }
                # Lista suspensa de pesquisa da barra de navegação
                # * * Observação: * * Visível apenas abaixo do ponto de interrupção lg
                li -Class "nav-item dropdown no-caret me-3 d-lg-none" {
                    a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -Id "searchDropdown" -href "#" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "fa fa-search" }
                    # Lista suspensa - Pesquisar
                    Div -Class "dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="searchDropdown" } {
                        Form -action "#" -Class "form-inline me-auto w-100" -method post -Content {
                            Div -Class "input-group input-group-joined input-group-solid" {
                                input -Class "form-control pe-0" -name "DropdownSearch" -type "text" -Attributes @{ "placeholder"="Search for...";"aria-label"="Search";"aria-describedby"="basic-addon2" }
                                  Div -Class "input-group-text" { i -Class "fa fa-search" }
                            }
                        } -enctype "application/x-www-form-urlencoded" -target "_self"
                    }
                }
                # Lista suspensa de alertas
                li -Class "nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications" {
                      a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -Id "navbarDropdownAlerts" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "fa-regular fa-bell" } 
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownAlerts" } {
                        h6 -Class "dropdown-header dropdown-notifications-header" {
                            i -Class "fa-regular fa-bell me-2"
                            "Central de alertas"
                        }
                        # Alerta de exemplo 1
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-warning" { i -Class "bi bi-activity text-light" }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "29 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Esta é uma mensagem de alerta. Não é nada sério, mas requer sua atenção." }
                           }
                        }
                        # Alerta de exemplo 2
                        a -Class  "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-info" { i -Class "fa fa-bar-chart text-light" }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "22 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Um novo relatório mensal está pronto. Clique aqui para ver!" }
                            }
                        }
                        # Alerta de exemplo 3
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-danger" { i -Class "fa fa-exclamation-triangle text-light" }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "8 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Falha crítica do sistema, sistemas desligando." }
                            }
                        }
                        # Alerta de exemplo 4
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                           Div -Class "dropdown-notifications-item-icon bg-success" { i -Class "fa fa-user-plus text-light" }
                           Div -Class "dropdown-notifications-item-content" {
                               Div -Class "dropdown-notifications-item-content-details" { "2 de dezembro de 2021" }
                               Div -Class "dropdown-notifications-item-content-text" { "Solicitação de novo usuário. Woody solicitou acesso à organização." }
                           }
                        }
                        a -Class "dropdown-item dropdown-notifications-footer" -href "#!" { "Ver todos os alertas" }
                    }
                }
                # Lista suspensa de mensagens
                li -Class "nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications" {
                      a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -id "navbarDropdownMessages" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "fa-regular fa-envelope" }
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownMessages" } {
                        h6 -Class "dropdown-header dropdown-notifications-header" {
                            i -Class "fa-regular fa-envelope me-2" 
                            "Central de mensagens"
                        }
                        # Mensagem de exemplo 1 
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            img -Class "dropdown-notifications-item-img" -src "./img/profiles/profile-2.png"
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-text" { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
                                Div -Class "dropdown-notifications-item-content-details" { "Thomas Wilcox · 58m" }
                            }
                        }
                        # Mensagem de exemplo 2
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            img -Class "dropdown-notifications-item-img" -src "./img/profiles/profile-3.png"
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-text" { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
                                Div -Class "dropdown-notifications-item-content-details" { "Emily Fowler · 2d" }
                            }
                        }
                        # Mensagem de exemplo 3
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            img -Class "dropdown-notifications-item-img" -src "./img/profiles/profile-4.png" 
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-text" { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
                                Div  -Class "dropdown-notifications-item-content-details" { "Marshall Rosencrantz · 3d" }
                            }
                        }
                        # Mensagem de exemplo 4-->
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            img -Class "dropdown-notifications-item-img" -src "./img/profiles/profile-5.png" 
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-text" { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
                                Div -Class "dropdown-notifications-item-content-details" { "Colby Newton · 3d" }
                            }
                        }
                        # Link do rodapé
                        a -Class "dropdown-item dropdown-notifications-footer" -href "#!" { "Ler todas as mensagens" }
                    }
                }
                # User Dropdown-->
                li -Class "nav-item dropdown no-caret dropdown-user me-3 me-lg-4" {
                    a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -id "navbarDropdownUserImage" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { img -Class "img-fluid" -src "./img/profiles/profile-1.png" }
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownUserImage" } {
                        h6 -Class "dropdown-header d-flex align-items-center" {
                            img -Class "dropdown-user-img" -src "./img/profiles/profile-1.png"
                            Div -Class "dropdown-user-details" {
                               Div -Class "dropdown-user-details-name" { "Valerie Luna" }
                               Div -Class "dropdown-user-details-email" { "vluna@aol.com" }
                            }
                        }
                        Div -Class "dropdown-divider"
                        a -Class "dropdown-item" -href "#!" {
                            Div -Class "dropdown-item-icon" { i -Class "fa fa-cog" }
                            "Conta"
                        }
                        a -Class "dropdown-item" -href "#!" {
                            Div -Class "dropdown-item-icon"{ i -Class "fa fa-sign-out" }
                            "Sair"
                        }
                    }
                }
            }
        } # Nav
        # Menu
        Div -Id "layoutSidenav" {
            Div -id "layoutSidenav_nav" {
                nav -Class "sidenav shadow-right sidenav-light" {
                    Div -Class "sidenav-menu" {
                        Div -Class "nav accordion" -id "accordionSidenav" {
                            # Sidenav Menu Heading (Account)
                            # * * Observação: * * Visível apenas em e acima do ponto de interrupção sm
                            Div -Class "sidenav-menu-heading d-sm-none" { "Conta" }
                            # Sidenav Link (Alerts)
                            # * * Observação: * * Visível apenas em e acima do ponto de interrupção sm
                            a -Class "nav-link d-sm-none" -href "#!" {
                                Div -Class "nav-link-icon" { i -Class "bi bi-bell" }
                                "Alertas"
                                span -Class "badge bg-warning-soft text-warning ms-auto" { "4 Novo!" }
                            }
                            # Sidenav Link (Messages)
                            # * * Observação: * * Visible only on and above the sm breakpoint
                            a -Class "nav-link d-sm-none" -href "#!" {
                                Div -Class "nav-link-icon" { i -Class "bi bi-envelope" }
                                "Mensagens"
                                span -Class "badge bg-success-soft text-success ms-auto" { "2 Novo!" }
                            }
                            # Sidenav Menu Heading (Core)
                            Div -Class "sidenav-menu-heading" { "Inicio" }
                            # Sidenav Accordion (Dashboard)
                            a -Class "nav-link active" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseDashboards";"aria-expanded"="false";"aria-controls"="collapseDashboards" } {
                                Div -Class "nav-link-icon" { i -Class "bi bi-activity" -Attributes @{ "style"="font-weight: bold;" } }
                                "Dashboards"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } #bi bi-chevron-down
                            }
                            Div -Class "collapse show" -Id "collapseDashboards" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -Id "accordionSidenavPages" {
                                    a -Class "nav-link active" -href "dashboard-1.html" {
                                        "Default"
                                        span -Class "badge bg-primary-soft text-primary ms-auto" { "Atualizado" }
                                    }
                                    a -Class "nav-link" -href "dashboard-2.html" { "Multiuso" }
                                    a -Class "nav-link" -href "dashboard-3.html" { "Afiliado" }
                                }
                            }

                            # Cabeçalho do Sidenav (Personalizado)
                            Div -Class "sidenav-menu-heading" {"Personalizado"}
                            # Acordeão Sidenav (Páginas)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapsePages";"aria-expanded"="false";"aria-controls"="collapsePages" } {
                                Div -Class "nav-link-icon" { i -class "bi bi-grid" }
                                "Páginas"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } 
                            }
                            Div -Class "collapse" -id "collapsePages" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavPagesMenu" {
                                    # Acordeão Sidenav aninhado (Páginas -> Conta)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAccount";"aria-expanded"="false";"aria-controls"="pagesCollapseAccount" } {
                                        "Conta"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down"}
                                    }
                                    Div -Class "collapse" -Id "pagesCollapseAccount" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "account-profile.html" { "Perfil" }
                                            a -Class "nav-link" -href "account-billing.html" { "Cobrança" }
                                            a -Class "nav-link" -href "account-security.html" { "Segurança" }
                                            a -Class "nav-link" -href "account-notifications.html" { "Notificações" }
                                        }
                                    }
                                    # Acordeão Sidenav Aninhado (Páginas -> Autenticação)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAuth";"aria-expanded"="false";"aria-controls"="pagesCollapseAuth" } {
                                        "Autenticação"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "pagesCollapseAuth" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                                       nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavPagesAuth" {
                                            # Acordeão Sidenav aninhado (Páginas -> Autenticação -> Básico)
                                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAuthBasic";"aria-expanded"="false";"aria-controls"="pagesCollapseAuthBasic" } {
                                                "Básico"
                                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                                            }
                                            Div -Class "collapse" -id "pagesCollapseAuthBasic" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesAuth" } {
                                               nav -Class "sidenav-menu-nested nav" {
                                                   a -Class "nav-link" -href "auth-login-basic.html" { "Login" }
                                                   a -Class "nav-link" -href "auth-register-basic.html" { "Registro" }
                                                   a -Class "nav-link" -href "auth-password-basic.html" { "Esqueceu sua senha" }
                                               }
                                            }
                                            # Acordeão Sidenav aninhado (Páginas -> Autenticação -> Social)
                                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAuthSocial";"aria-expanded"="false";"aria-controls"="pagesCollapseAuthSocial" } {
                                                "Social"
                                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                                            }
                                            Div -Class "collapse" -id "pagesCollapseAuthSocial" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesAuth" } {
                                                nav -Class "sidenav-menu-nested nav" {
                                                    a -Class "nav-link" -href "auth-login-social.html" { "Login" }
                                                    a -Class "nav-link" -href "auth-register-social.html" { "Registro" }
                                                    a -Class "nav-link" -href "auth-password-social.html" { "Esqueceu sua senha" }
                                                }
                                            }
                                        }
                                    }
                                    # Acordeão Sidenav Aninhado (Páginas -> Erro)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseError";"aria-expanded"="false";"aria-controls"="pagesCollapseError" } {
                                        "Erro"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "pagesCollapseError" -Attributes @{ "data-bs-parent"="#accordionSidenavPagesMenu" } {
                                       nav -Class "sidenav-menu-nested nav" {
                                           a -Class "nav-link" -href "error-400.html" { "400 Error" }
                                           a -Class "nav-link" -href "error-401.html" { "401 Error" }
                                           a -Class "nav-link" -href "error-403.html" { "403 Error" }
                                           a -Class "nav-link" -href "error-404-1.html" { "404 Error 1" }
                                           a -Class "nav-link" -href "error-404-2.html" { "404 Error 2" }
                                           a -Class "nav-link" -href "error-500.html" { "500 Error" }
                                           a -Class "nav-link" -href "error-503.html" { "503 Error" }
                                           a -Class "nav-link" -href "error-504.html" { "504 Error" }
                                       }
                                    }
                                    a -Class "nav-link" -href "pricing.html" { "Preços" }
                                    a -Class "nav-link" -href "invoice.html" { "Fatura" }
                                }
                            }
                            # Sidenav Accordion (Applications)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseApps";"aria-expanded"="false";"aria-controls"="collapseApps" } {
                                Div -Class "nav-link-icon" { i -Class "bi bi-window" } 
                                "Aplicações"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" } #bi bi-chevron-down; fas fa-angle-down
                            }
                            Div -Class "collapse" -id "collapseApps" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavAppsMenu" {
                                    # Nested Sidenav Accordion (Apps -> Knowledge Base) 
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#appsCollapseKnowledgeBase";"aria-expanded"="false";"aria-controls"="appsCollapseKnowledgeBase" } {
                                        "Base de conhecimento"
                                        Div -Class "sidenav-collapse-arrow" { i -class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "appsCollapseKnowledgeBase" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "knowledge-base-home-1.html" { "Casa 1" }
                                            a -Class "nav-link" -href "knowledge-base-home-2.html" { "Casa 2" }
                                            a -Class "nav-link" -href "knowledge-base-category.html" { "Categoria" }
                                            a -Class "nav-link" -href "knowledge-base-article.html" { "Artigo" }
                                        }
                                    }
                                    # Nested Sidenav Accordion (Apps -> User Management) 
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#appsCollapseUserManagement";"aria-expanded"="false";"aria-controls"="appsCollapseUserManagement" } {
                                        "Gerenciamento de usuários"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "appsCollapseUserManagement" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "user-management-list.html" { "Lista de usuários" }
                                            a -Class "nav-link" -href "user-management-edit-user.html" { "Editar usuário" }
                                            a -Class "nav-link" -href "user-management-add-user.html" { "Adicionar usuário" }
                                            a -Class "nav-link" -href "user-management-groups-list.html" { "Lista de grupos" }
                                            a -Class "nav-link" -href "user-management-org-details.html" { "Detalhes da organização" }
                                        }
                                    }
                                    # Nested Sidenav Accordion (Apps -> Posts Management) 
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#appsCollapsePostsManagement";"aria-expanded"="false";"aria-controls"="appsCollapsePostsManagement" } {
                                        "Gerenciamento de postagens"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "appsCollapsePostsManagement" -Attributes @{ "data-bs-parent"="#accordionSidenavAppsMenu" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "blog-management-posts-list.html" { "Lista de postagens" }
                                            a -Class "nav-link" -href "blog-management-create-post.html" { "Criar postagem" }
                                            a -Class "nav-link" -href "blog-management-edit-post.html" { "Editar post" }
                                            a -Class "nav-link" -href "blog-management-posts-admin.html" { "Posts Admin" }
                                        }
                                    }
                                }
                            }
                            # Sidenav Accordion (Flows)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseFlows";"aria-expanded"="false";"aria-controls"="collapseFlows" } {
                                Div -Class "nav-link-icon" { i -Class "fa-solid fa-repeat" } 
                                "Fluxos"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                            }
                            Div -Class "collapse" -id "collapseFlows" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav" {
                                    a -Class "nav-link" -href "multi-tenant-select.html" { "Registro de vários locatários" }
                                    a -Class "nav-link" -href "wizard.html" { "Mago" }
                                }
                            }
                            # Sidenav Heading (UI Toolkit)
                            Div -Class "sidenav-menu-heading" { "UI Kit de ferramentas" }
                            # Sidenav Accordion (Layout)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayouts";"aria-expanded"="false";"aria-controls"="collapseLayouts" } {
                                Div -Class "nav-link-icon" { i -class "bi bi-window-sidebar" } 
                                "Layout"
                                Div -Class "sidenav-collapse-arrow" { i -class "fas fa-angle-down" }
                            }
                            Div -Class "collapse" -id "collapseLayouts" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavLayout" {
                                    # Nested Sidenav Accordion (Layout -> Navigation)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutSidenavVariations";"aria-expanded"="false";"aria-controls"="collapseLayoutSidenavVariations" } {
                                       "Navegação"
                                       Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "collapseLayoutSidenavVariations" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
                                       nav -Class "sidenav-menu-nested nav" {
                                           a -Class "nav-link" -href "layout-static.html" { "Sidenav estático" }
                                           a -Class "nav-link" -href "layout-dark.html" { "Dark Sidenav" }
                                           a -Class "nav-link" -href "layout-rtl.html" { "Layout RTL" }
                                       }
                                    }
                                    # Nested Sidenav Accordion (Layout -> Container Options)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutContainers";"aria-expanded"="false";"aria-controls"="collapseLayoutContainers" } {
                                        "Opções de contêiner"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "collapseLayoutContainers" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "layout-boxed.html" {"Layout em caixa"}
                                            a -Class "nav-link" -href "layout-fluid.html" {"Layout Fluido"}
                                        }
                                    }
                                    # Nested Sidenav Accordion (Layout -> Page Headers)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutsPageHeaders";"aria-expanded"="false";"aria-controls"="collapseLayoutsPageHeaders" } {
                                        "Cabeçalhos de página"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -Id "collapseLayoutsPageHeaders" -Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "header-simplified.html" {"Simplificado"}
                                            a -Class "nav-link" -href "header-compact.html" {"Compactar"}
                                            a -Class "nav-link" -href "header-overlap.html" {"Sobreposição de conteúdo"}
                                            a -Class "nav-link" -href "header-breadcrumbs.html" {"Migalhas de pão"}
                                            a -Class "nav-link" -href "header-light.html" {"Leve"}
                                        }
                                    }
                                    # Nested Sidenav Accordion (Layout -> Starter Layouts)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseLayoutsStarterTemplates";"aria-expanded"="false";"aria-controls"="collapseLayoutsStarterTemplates" } {
                                       "Layouts iniciais"
                                       Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    Div -Class "collapse" -id "collapseLayoutsStarterTemplates"-Attributes @{ "data-bs-parent"="#accordionSidenavLayout" } {
                                        nav -Class "sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "starter-default.html" { "Predefinição" }
                                            a -Class "nav-link" -href "starter-minimal.html" { "Mínimo" }
                                        }
                                    }
                                }
                            }
                            # Sidenav Accordion (Components)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseComponents";"aria-expanded"="false";"aria-controls"="collapseComponents" } {
                                Div -Class "nav-link-icon" { i -Class "bi bi-box-seam" }
                                "Componentes"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                            }
                            Div -Class "collapse" -id "collapseComponents" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav" {
                                    a -Class "nav-link" -href "alerts.html" {"Alertas"}
                                    a -Class "nav-link" -href "avatars.html" {"Avatares"}
                                    a -Class "nav-link" -href "badges.html" {"Distintivos"}
                                    a -Class "nav-link" -href "buttons.html" {"Botões"}
                                    a -Class "nav-link" -href "cards.html" {
                                       "Cartões"
                                       span -Class "badge bg-primary-soft text-primary ms-auto" {"Atualizado"}
                                    }
                                    a -Class "nav-link" -href "dropdowns.html" {"Listas suspensas"}
                                    a -Class "nav-link" -href "forms.html" {
                                       "Formulários"
                                       span -Class "badge bg-primary-soft text-primary ms-auto" { "Atualizado" }
                                    }
                                    a -Class "nav-link" -href "modals.html" {"Modais"}
                                    a -Class "nav-link" -href "navigation.html" {"Navegação"}
                                    a -Class "nav-link" -href "progress.html" {"Progresso"}
                                    a -Class "nav-link" -href "step.html" {"Etapa"}
                                    a -Class "nav-link" -href "timeline.html" {"Linha do tempo"}
                                    a -Class "nav-link" -href "toasts.html" {"Torradas"}
                                    a -Class "nav-link" -href "tooltips.html" {"Dicas de ferramentas"}
                                }
                            }
                            # Sidenav Accordion (Utilities)
                            a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseUtilities";"aria-expanded"="false";"aria-controls"="collapseUtilities" } {
                               Div -Class "nav-link-icon" { i -Class "bi bi-tools" }
                               "Utilitários"
                               Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                            }
                            Div -Class "collapse" -id "collapseUtilities" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                               nav -Class "sidenav-menu-nested nav" {
                                   a -Class "nav-link" -href "animations.html" {"Animações"}
                                   a -Class "nav-link" -href "background.html" {"Fundo"}
                                   a -Class "nav-link" -href "borders.html" {"Bordas"}
                                   a -Class "nav-link" -href "lift.html" {"Elevado"}
                                   a -Class "nav-link" -href "shadows.html" {"Sombras"}
                                   a -Class "nav-link" -href "typography.html" {"Tipografia"}
                               }
                            }
                            # Sidenav Heading (Addons)
                            Div -Class "sidenav-menu-heading" { "Plug-ins" }
                            # Sidenav Link (Charts)
                            a -Class "nav-link" -href "charts.html" {
                               Div -Class "nav-link-icon" { i -Class "bi bi-bar-chart" }
                               "Gráficos"
                            }
                            # Sidenav Link (Tables)
                            a -Class "nav-link" -href "tables.html" {
                                Div -Class "nav-link-icon" { i -Class "bi bi-funnel" }
                                "Tabelas"
                            }

                        }
                    }
                    # Sidenav Footer
                    Div -Class "sidenav-footer" {
                       Div -Class "sidenav-footer-content" {
                          Div -Class "sidenav-footer-subtitle" { "logado como:" }
                          Div -Class "sidenav-footer-title" { "Valerie Luna" }
                       }
                    }

                }
            }
            Div -id "layoutSidenav_content" {
                Div -Id "Main" {
                    header -Class "page-header page-header-dark bg-gradient-primary-to-secondary pb-10" {
                       Div -Class "container-xl px-4" {
                           Div -Class "page-header-content pt-4" {
                               Div -Class "row align-items-center justify-content-between" {
                                   Div -Class "col-auto mt-4" {
                                       h1 -Class "page-header-title" {
                                           Div -Class "page-header-icon" { i -Class "bi bi-activity" }
                                           "Dashboard"
                                       }
                                       Div -Class "page-header-subtitle" { "Exemplo de visão geral do painel e resumo de conteúdo" }
                                   }
                                   Div -Class "col-12 col-xl-auto mt-4" {
                                       Div -Class "input-group input-group-joined border-0" -Attributes @{ "Style"="width: 16.5rem"} {
                                            span -Class "input-group-text" { i -Class "bi bi-calendar text-primary" } 
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
                                                    h1 -Class "text-primary" { "Bem-vindo ao SB Admin Pro!" }
                                                     p -Class "text-gray-700 mb-0" { "Navegue pelo nosso kit de ferramentas de interface do usuário totalmente projetado! Navegue por nossas páginas, componentes e utilitários de aplicativos pré-criados e certifique-se de consultar nossa documentação completa!" }
                                                }
                                            }
                                            Div -Class "col-xl-4 col-xxl-12 text-center" { 
                                                img -Class "img-fluid" -src "./img/illustrations/at-work.svg" -Style "max-width: 26rem" 
                                            } 
                                        }
                                    }
                                }
                            }
                            Div -Class "col-xxl-4 col-xl-6 mb-4" {
                                Div -Class "card card-header-actions h-100" {
                                    Div -Class "card-header" {
                                        "Atividades recentes"
                                        Div -Class "dropdown no-caret" {
                                            button -Class "btn btn-transparent-dark btn-icon dropdown-toggle" -Id "dropdownMenuButton" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "feather feather-more-vertical text-gray-500" }
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
                                                    a -Class "fw-bold text-dark" -href "#!" {" Pedido nº 2912 " }
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
                                                    a -Class "fw-bold text-dark" -href "#!" {" relatório semanal "}
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
                                                   a -Class "fw-bold text-dark" -href "#!" {" Valerie Luna " }
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
                                                   a -Class "fw-bold text-dark" -href "#!" {" Pedido nº 2911 " }
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
                                                    a -Class "fw-bold text-dark" -href "#!" {" Reunião de Marketing e Planejamento " }
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
                                                    a -Class "fw-bold text-dark" -href "#!" {" Pedido nº 2910 "}
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
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -id "dropdownMenuButton" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "feather feather-more-vertical text-gray-500" }
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{"aria-labelledby"="dropdownMenuButton"} {
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "feather feather-list text-gray-500" }
                                                    "Gerenciar tarefas" 
                                                }
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "feather feather-plus-circle text-gray-500" }
                                                   "Adicionar nova tarefa"
                                                }
                                                a -Class "dropdown-item" -href "#!" {
                                                    Div -Class "dropdown-item-icon" { i -Class "feather feather-minus-circle text-gray-500" }
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
                                            a -Class "stretched-link text-body" -href "#!" {"Visite o Centro de Tarefas"}
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
                                            i -Class "bi bi-calendar text-white-50 fa-3x" #i class="far fa-calendar" 
                                        }
                                    }
                                    Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                          a -Class "text-white stretched-link" -href "#!" {"Ver relatório"}
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
                                           i -class "bi bi-currency-dollar text-white-50 fa-3x"
                                       }
                                   }
                                   Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                         a -Class "text-white stretched-link" -href "#!" {"Ver relatório"}
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
                                           i -Class "bi bi-check2-square text-white-50 fa-3x"
                                       }
                                   }
                                   Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                         a -Class "text-white stretched-link" -href "#!" {"Ver tarefas"}
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
                                           i -Class "bi bi-chat text-white-50 fa-3x"
                                       }
                                   }
                                   Div -Class "card-footer d-flex align-items-center justify-content-between small" {
                                         a -Class "text-white stretched-link" -href "#!" {"Visualizar solicitações"}
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
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -id "areaChartDropdownExample" -Attributes @{ "type"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -class "bi bi-three-dots-vertical text-gray-500" }
                                            Div -Class "dropdown-menu dropdown-menu-end animated--fade-in-up" -Attributes @{ "aria-labelledby"="areaChartDropdownExample";"style"=""} {
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
                                            button -class "btn btn-transparent-dark btn-icon dropdown-toggle" -Id "areaChartDropdownExample" -Attributes @{ "data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Class "bi bi-three-dots-vertical text-gray-500" }
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
                                Div -Class "dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns" { 
                                    Div -Class "dataTable-top" { 
                                        Div -Class "dataTable-dropdown" { 
                                            label {
                                                selecttag -class "dataTable-selector" { 
                                                    option -value  "5" -Content  "5"
                                                    option -value "10" -Content "10" -Selected "" 
                                                    option -value "15" -Content "15"
                                                    option -value "20" -Content "20"
                                                    option -value "25" -Content "25"
                                                } 
                                                "entradas por página"
                                            }
                                        }
                                        Div -Class "dataTable-search" {
                                            input -Class "dataTable-input" -name "dataTable" -type "text" -Attributes @{"placeholder"="Procurar..."} 
                                        }
                                    }
                                    Div -class "dataTable-container" {
                                        Table -id "datatablesSimple" -Class "dataTable-table" {
                                            Thead {
                                                tr { 
                                                    Th -Attributes @{"data-sortable"=""} -Style "width: 15.4126%;" { a -href "#" -Class "dataTable-sorter" {"Nome"}}
                                                    Th -Attributes @{"data-sortable"=""} -Style "width: 23.1728%;" { a -href "#" -Class "dataTable-sorter" {"Posição"}}
                                                    Th -Attributes @{"data-sortable"=""} -Style "width: 12.8259%;" { a -href "#" -Class "dataTable-sorter" {"Escritório"}}
                                                    Th -Attributes @{"data-sortable"=""} -Style "width: 7.43685%;" { a -href "#" -Class "dataTable-sorter" {"Idade"}}
                                                    th -Attributes @{"data-sortable"=""} -Style "width: 11.8558%;" { a -href "#" -Class "dataTable-sorter" {"Data de início"}}
                                                    th -Attributes @{"data-sortable"=""} -Style "width: 9.9158%;"  { a -href "#" -Class "dataTable-sorter" {"Salário"}}
                                                    th -Attributes @{"data-sortable"=""} -Style "width: 9.16133%;" { a -href "#" -Class "dataTable-sorter" {"Status"}}
                                                    th -Attributes @{"data-sortable"=""} -Style "width: 10.1314%;" { a -href "#" -Class "dataTable-sorter" {"Ações"}}
                                                }
                                            }
                                            tbody {
                                                tr {
                                                    td "Tiger Nixon"; td "Arquiteto de Sistemas"; td "Edinburgh"; td "61"; td "2011/04/25"; td "`$320,800"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" }; 
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Garrett Winters"; td "Contador"; td "Tokyo"; td "63"; td "2011/07/25"; td "`$170,750"; td {Div -Class "badge bg-warning rounded-pill" "Pendente"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Ashton Cox"; td "Autor Técnico Júnior"; td "San Francisco"; td "66"; td "2009/01/12"; td "`$86,000"; td {Div -Class "badge bg-secondary text-white rounded-pill" "Tempo parcial"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                    };
                                                tr {
                                                    td "Cedric Kelly"; td "Desenvolvedor Javascript Sênior"; td "Edinburgh"; td "22"; td "2012/03/29"; td "`$433,060"; td {Div -Class "badge bg-info rounded-pill" "Contrato"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Airi Satou"; td "Contador"; td "Tokyo"; td "33"; td "2008/11/28"; td "`$162,700"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Brielle Williamson"; td "Especialista em Integração"; td "New York"; td "61"; td "2012/12/02"; td "`$372,000"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Herrod Chandler"; td "Assistente de vendas"; td "San Francisco"; td "59"; td "2012/08/06"; td "`$137,500"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr { 
                                                    td "Rhona Davidson"; td "Especialista em Integração"; td "Tokyo"; td "55"; td "2010/10/14"; td "`$327,900"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark" { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Colleen Hurst"; td "Desenvolvedor Javascript"; td "San Francisco"; td "39"; td "2009/09/15"; td "`$205,500"; td {Div -Class "badge bg-info rounded-pill" "Contrato"};
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark"  { i -Class "bi bi-trash3" }}
                                                   };
                                                tr {
                                                    td "Sonya Frost"; td "Engenheiro de software"; td "Edinburgh"; td "23"; td "2008/12/13"; td "`$103,600"; td {Div -Class "badge bg-primary text-white rounded-pill" "Tempo total"}; 
                                                    td {button -Class "btn btn-datatable btn-icon btn-transparent-dark me-2" { i -Class "bi bi-three-dots-vertical" };
                                                        button -Class "btn btn-datatable btn-icon btn-transparent-dark"  { i -Class "bi bi-trash3" }}
                                                };
                                            }
                                        }
                                    }
                                    Div -Class "dataTable-bottom" {
                                        Div -Class "dataTable-info" {"Mostrando 1 a 10 de 57 entradas"}
                                        nav -Class "dataTable-pagination" {
                                            ul -Class "dataTable-pagination-list" {
                                                li -Class "active" { a -href "#" -Attributes @{"target"="_self";"data-page"="1"} "1"}
                                                li -Class "" { a -href "#" -Attributes @{"target"="_self";"data-page"="2"} "2" }
                                                li -Class "" { a -href "#" -Attributes @{"target"="_self";"data-page"="3"} "3" }
                                                li -Class "" { a -href "#" -Attributes @{"target"="_self";"data-page"="4"} "4" }
                                                li -Class "" { a -href "#" -Attributes @{"target"="_self";"data-page"="5"} "5" }
                                                li -Class "" { a -href "#" -Attributes @{"target"="_self";"data-page"="6"} "6" }
                                                li -Class "pager" { a -href "#" -Attributes @{"target"="_self";"data-page"="2"} "›" }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                footer -Class "footer-admin mt-auto footer-light" {
                   div -Class "container-xl px-4" {
                      div -Class "row" {
                         div -Class "col-md-6 small" { "Direitos autorais © Seu site 2021" }
                         div -Class "col-md-6 text-md-end small" {
                             a -href "#!" { "Política de Privacidade" }
                             "·"
                             a -href "#!" { "Termos &amp; Condições" }
                         }
                      }
                   }
                }
            }
        }
        script -src "./js/bootstrap.bundle.min.js"
        script -src "./js/scripts2.js"
        script -src "./js/Chart.min.js" 
        script -src "./js/chart-area-demo2.js"
        script -src "./js/chart-bar-demo2.js"
        script -src "./js/datatables-simple-demo.js"
        script -src "./js/simple-datatables@latest.js"
        #script -src "./js/bundle.js"
        #script -src "./js/litepicker.js"
        script -src "./js/sb-customizer.js"

        #script -type text/javascript -content "feather.replace();"

#        <sb-customizer project="sb-admin-pro" _nghost-yld-c10="" ng-version="11.1.2"><div _ngcontent-yld-c10="" id="style-switcher" class="sb-customizer sb-customizer-closed"><button _ngcontent-yld-c10="" class="sb-customizer-toggler"><fa-icon _ngcontent-yld-c10="" class="ng-fa-icon"><svg role="img" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="cog" class="svg-inline--fa fa-cog fa-w-16 fa-spin" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M487.4 315.7l-42.6-24.6c4.3-23.2 4.3-47 0-70.2l42.6-24.6c4.9-2.8 7.1-8.6 5.5-14-11.1-35.6-30-67.8-54.7-94.6-3.8-4.1-10-5.1-14.8-2.3L380.8 110c-17.9-15.4-38.5-27.3-60.8-35.1V25.8c0-5.6-3.9-10.5-9.4-11.7-36.7-8.2-74.3-7.8-109.2 0-5.5 1.2-9.4 6.1-9.4 11.7V75c-22.2 7.9-42.8 19.8-60.8 35.1L88.7 85.5c-4.9-2.8-11-1.9-14.8 2.3-24.7 26.7-43.6 58.9-54.7 94.6-1.7 5.4.6 11.2 5.5 14L67.3 221c-4.3 23.2-4.3 47 0 70.2l-42.6 24.6c-4.9 2.8-7.1 8.6-5.5 14 11.1 35.6 30 67.8 54.7 94.6 3.8 4.1 10 5.1 14.8 2.3l42.6-24.6c17.9 15.4 38.5 27.3 60.8 35.1v49.2c0 5.6 3.9 10.5 9.4 11.7 36.7 8.2 74.3 7.8 109.2 0 5.5-1.2 9.4-6.1 9.4-11.7v-49.2c22.2-7.9 42.8-19.8 60.8-35.1l42.6 24.6c4.9 2.8 11 1.9 14.8-2.3 24.7-26.7 43.6-58.9 54.7-94.6 1.5-5.5-.7-11.3-5.6-14.1zM256 336c-44.1 0-80-35.9-80-80s35.9-80 80-80 80 35.9 80 80-35.9 80-80 80z"></path></svg></fa-icon></button><div _ngcontent-yld-c10="" class="sb-customizer-heading shadow">Theme Customizer</div><div _ngcontent-yld-c10="" class="sb-customizer-content d-flex flex-column justify-content-between"><div _ngcontent-yld-c10=""><h6 _ngcontent-yld-c10="" class="sb-customizer-subheading">Try a pre-built swatch!</h6><div _ngcontent-yld-c10="" class="sb-customizer-content-swatches mb-4"><div _ngcontent-yld-c10="" id="swatch1"><button _ngcontent-yld-c10="" class="btn-customizer swatch" id="swatch1">Default<!----><!----></button></div><div _ngcontent-yld-c10="" id="swatch2"><button _ngcontent-yld-c10="" class="btn-customizer swatch" id="swatch2">Flat<!----><!----></button></div><div _ngcontent-yld-c10="" id="swatch3"><button _ngcontent-yld-c10="" class="btn-customizer swatch" id="swatch3">Sunset<!----><!----></button></div><div _ngcontent-yld-c10="" id="swatch4"><button _ngcontent-yld-c10="" class="btn-customizer swatch" id="swatch4">Subtle<!----><!----></button></div><div _ngcontent-yld-c10="" id="swatch5"><button _ngcontent-yld-c10="" class="btn-customizer swatch" id="swatch5">Seafoam<!----><!----></button></div><!----></div><h6 _ngcontent-yld-c10="" class="sb-customizer-subheading">Or choose your own colors...</h6><div _ngcontent-yld-c10="" id="chooser" class="mb-4"><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-primary" data-palette-id="primary"><span _ngcontent-yld-c10=""> Primary &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-secondary" data-palette-id="secondary"><span _ngcontent-yld-c10=""> Secondary &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-success" data-palette-id="success"><span _ngcontent-yld-c10=""> Success &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-danger" data-palette-id="danger"><span _ngcontent-yld-c10=""> Danger &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-warning" data-palette-id="warning"><span _ngcontent-yld-c10=""> Warning &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><button _ngcontent-yld-c10="" type="button" cpposition="top-left" class="btn-customizer btn-info" data-palette-id="info"><span _ngcontent-yld-c10=""> Info &nbsp;<span _ngcontent-yld-c10="" class="text-white-50"></span></span><!----><!----></button><!----><!----></div><h6 _ngcontent-yld-c10="" class="sb-customizer-subheading">Need ideas? Randomize!</h6><button _ngcontent-yld-c10="" class="btn-customizer btn btn-outline-dark">Randomize Colors<fa-icon _ngcontent-yld-c10="" class="ng-fa-icon"><svg role="img" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="random" class="svg-inline--fa fa-random fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M504.971 359.029c9.373 9.373 9.373 24.569 0 33.941l-80 79.984c-15.01 15.01-40.971 4.49-40.971-16.971V416h-58.785a12.004 12.004 0 0 1-8.773-3.812l-70.556-75.596 53.333-57.143L352 336h32v-39.981c0-21.438 25.943-31.998 40.971-16.971l80 79.981zM12 176h84l52.781 56.551 53.333-57.143-70.556-75.596A11.999 11.999 0 0 0 122.785 96H12c-6.627 0-12 5.373-12 12v56c0 6.627 5.373 12 12 12zm372 0v39.984c0 21.46 25.961 31.98 40.971 16.971l80-79.984c9.373-9.373 9.373-24.569 0-33.941l-80-79.981C409.943 24.021 384 34.582 384 56.019V96h-58.785a12.004 12.004 0 0 0-8.773 3.812L96 336H12c-6.627 0-12 5.373-12 12v56c0 6.627 5.373 12 12 12h110.785c3.326 0 6.503-1.381 8.773-3.812L352 176h32z"></path></svg></fa-icon></button><hr _ngcontent-yld-c10=""><h6 _ngcontent-yld-c10="" class="sb-customizer-subheading">Finished? Export your color palette file with install instructions!</h6><button _ngcontent-yld-c10="" class="btn-customizer btn btn-outline-primary mb-0">Export<fa-icon _ngcontent-yld-c10="" class="ng-fa-icon"><svg role="img" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="file-download" class="svg-inline--fa fa-file-download fa-w-12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path fill="currentColor" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm76.45 211.36l-96.42 95.7c-6.65 6.61-17.39 6.61-24.04 0l-96.42-95.7C73.42 337.29 80.54 320 94.82 320H160v-80c0-8.84 7.16-16 16-16h32c8.84 0 16 7.16 16 16v80h65.18c14.28 0 21.4 17.29 11.27 27.36zM377 105L279.1 7c-4.5-4.5-10.6-7-17-7H256v128h128v-6.1c0-6.3-2.5-12.4-7-16.9z"></path></svg></fa-icon></button></div><div _ngcontent-yld-c10=""><hr _ngcontent-yld-c10=""><div _ngcontent-yld-c10="" class="sb-customizer-notice small text-muted">Note: This customizer web component is an online-only tool and is not part of the download package when purchasing the theme.</div></div></div><!----><!----><!----></div></sb-customizer>
#        <script defer="" src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon="{&quot;rayId&quot;:&quot;6f9e33147cb325fd&quot;,&quot;token&quot;:&quot;6e2c2575ac8f44ed824cef7899ba8463&quot;,&quot;version&quot;:&quot;2021.12.0&quot;,&quot;si&quot;:100}" crossorigin="anonymous"></script>

        div -class "litepicker" -Attributes @{"style"="display:none";"data-plugins"="ranges";"data-ranges-position"="left"} {
            div -Class "container__main" { 
                div -Class "container__predefined-ranges" {
                    button -Attributes @{ "tabindex"="-1";"data-start"="1650856094523";"data-end"="1650856094523"} "Hoje"
                    button -Attributes @{ "tabindex"="-1";"data-start"="1649535799515";"data-end"="1649535799515"} "Ontem"
                    button -Attributes @{ "tabindex"="-1";"data-start"="1649103799515";"data-end"="1649622199515"} "Últimos 7 dias"
                    button -Attributes @{ "tabindex"="-1";"data-start"="1647116599515";"data-end"="1649622199515"} "Últimos 30 dias"
                    button -Attributes @{ "tabindex"="-1";"data-start"="1648844599515";"data-end"="1651287600000"} "Este mês"
                    button -Attributes @{ "tabindex"="-1";"data-start"="1646166199515";"data-end"="1648695600000"} "Mês passado"
                }
                div -Class "container__months columns-2" { 
                    div -Class "month-item" { 
                        div -Class "month-item-header" {
                            button -Attributes @{"type"="button"} -Class "button-previous-month" { 
                                #svg width="11" height="16" xmlns="http://www.w3.org/2000/svg" {
                                #    path d="M7.919 0l2.748 2.667L5.333 8l5.334 5.333L7.919 16 0 8z" fill-rule="nonzero" 
                                #}
                            }
                            div {
                                strong -Class "month-item-name" {"Abril"} 
                                    span -Class "month-item-year" {"2022"}
                            }
                            button -Attributes @{"type"="button"} -Class "button-next-month" {
                                #svg width="11" height="16" xmlns="http://www.w3.org/2000/svg" {
                                #    path d="M2.748 16L0 13.333 5.333 8 0 2.667 2.748 0l7.919 8z" fill-rule="nonzero"></path>
                                #}
                            }
                        }
                        div -Class "month-item-weekdays-row" {
                            div -Attributes @{"title"="Segunda-feira"}"Seg"
                            div -Attributes @{"title"="Terça-feira"  }"Ter"
                            div -Attributes @{"title"="Quarta-feira" }"Qua"
                            div -Attributes @{"title"="Quinta-feira" }"Qui"
                            div -Attributes @{"title"="Sexta-feira"  }"Sex"
                            div -Attributes @{"title"="Sábado"       }"Sáb"
                            div -Attributes @{"title"="Domingo"      }"Dom"
                        }
                        div -Class "container__days" {
                            div ""
                            div ""
                            div ""
                            div ""
                            div -Class "day-item" -Attributes @{"data-time"="1648782000000";"tabindex"="0"} " 1"
                            div -Class "day-item" -Attributes @{"data-time"="1648868400000";"tabindex"="0"} " 2"
                            div -Class "day-item" -Attributes @{"data-time"="1648954800000";"tabindex"="0"} " 3"
                            div -Class "day-item" -Attributes @{"data-time"="1649041200000";"tabindex"="0"} " 4"
                            div -Class "day-item" -Attributes @{"data-time"="1649127600000";"tabindex"="0"} " 5"
                            div -Class "day-item" -Attributes @{"data-time"="1649214000000";"tabindex"="0"} " 6"
                            div -Class "day-item" -Attributes @{"data-time"="1649300400000";"tabindex"="0"} " 7"
                            div -Class "day-item" -Attributes @{"data-time"="1649386800000";"tabindex"="0"} " 8"
                            div -Class "day-item" -Attributes @{"data-time"="1649473200000";"tabindex"="0"} " 9"
                            div -Class "day-item" -Attributes @{"data-time"="1649559600000";"tabindex"="0"} "10"
                            div -Class "day-item" -Attributes @{"data-time"="1649646000000";"tabindex"="0"} "11"
                            div -Class "day-item" -Attributes @{"data-time"="1649732400000";"tabindex"="0"} "12"
                            div -class "day-item" -Attributes @{"data-time"="1649818800000";"tabindex"="0"} "13" 
                            div -class "day-item" -Attributes @{"data-time"="1649905200000";"tabindex"="0"} "14" 
                            div -class "day-item" -Attributes @{"data-time"="1649991600000";"tabindex"="0"} "15" 
                            div -class "day-item" -Attributes @{"data-time"="1650078000000";"tabindex"="0"} "16" 
                            div -class "day-item" -Attributes @{"data-time"="1650164400000";"tabindex"="0"} "17" 
                            div -class "day-item" -Attributes @{"data-time"="1650250800000";"tabindex"="0"} "18" 
                            div -class "day-item" -Attributes @{"data-time"="1650337200000";"tabindex"="0"} "19" 
                            div -class "day-item" -Attributes @{"data-time"="1650423600000";"tabindex"="0"} "20" 
                            div -class "day-item" -Attributes @{"data-time"="1650510000000";"tabindex"="0"} "21" 
                            div -class "day-item" -Attributes @{"data-time"="1650596400000";"tabindex"="0"} "22" 
                            div -class "day-item" -Attributes @{"data-time"="1650682800000";"tabindex"="0"} "23" 
                            div -class "day-item" -Attributes @{"data-time"="1650769200000";"tabindex"="0"} "24" 
                            div -class "day-item" -Attributes @{"data-time"="1650855600000";"tabindex"="0"} "25" 
                            div -class "day-item" -Attributes @{"data-time"="1650942000000";"tabindex"="0"} "26" 
                            div -class "day-item" -Attributes @{"data-time"="1651028400000";"tabindex"="0"} "27" 
                            div -class "day-item" -Attributes @{"data-time"="1651114800000";"tabindex"="0"} "28" 
                            div -class "day-item" -Attributes @{"data-time"="1651201200000";"tabindex"="0"} "29" 
                            div -class "day-item" -Attributes @{"data-time"="1651287600000";"tabindex"="0"} "30" 
                        }
                    }
                
                    div -Class "month-item" {
                        div -Class "month-item-header" {
                            button -Attributes @{"type"="button"} -Class "button-previous-month" {
                                #svg width="11" height="16" xmlns="http://www.w3.org/2000/svg" {
                                #    path d="M7.919 0l2.748 2.667L5.333 8l5.334 5.333L7.919 16 0 8z" fill-rule="nonzero" 
                                #}
                            }
                            div {
                                strong -Class "month-item-name" {"Maio"}
                                  span -Class "month-item-year" {"2022"}
                            }
                            button -Attributes @{"type"="button"} -Class "button-next-month" {
                                #svg width="11" height="16" xmlns="http://www.w3.org/2000/svg" {
                                #    path d="M2.748 16L0 13.333 5.333 8 0 2.667 2.748 0l7.919 8z" fill-rule="nonzero"
                                #}
                            }
                        }
                        div -Class "month-item-weekdays-row" {
                            div -Attributes @{"title"="Segunda-feira"}"Seg"
                            div -Attributes @{"title"="Terça-feira"  }"Ter"
                            div -Attributes @{"title"="Quarta-feira" }"Qua"
                            div -Attributes @{"title"="Quinta-feira" }"Qui"
                            div -Attributes @{"title"="Sexta-feira"  }"Sex"
                            div -Attributes @{"title"="Sábado"       }"Sáb"
                            div -Attributes @{"title"="Domingo"      }"Dom"
                        }
                        div -Class "container__days" {
                            div ""
                            div ""
                            div ""
                            div ""
                            div ""
                            div ""
                            div -Class "day-item" -Attributes @{"data-time"="1651374000000";"tabindex"="0"} " 1"
                            div -Class "day-item" -Attributes @{"data-time"="1651460400000";"tabindex"="0"} " 2"
                            div -Class "day-item" -Attributes @{"data-time"="1651546800000";"tabindex"="0"} " 3"
                            div -Class "day-item" -Attributes @{"data-time"="1651633200000";"tabindex"="0"} " 4"
                            div -Class "day-item" -Attributes @{"data-time"="1651719600000";"tabindex"="0"} " 5"
                            div -Class "day-item" -Attributes @{"data-time"="1651806000000";"tabindex"="0"} " 6"
                            div -Class "day-item" -Attributes @{"data-time"="1651892400000";"tabindex"="0"} " 7"
                            div -Class "day-item" -Attributes @{"data-time"="1651978800000";"tabindex"="0"} " 8"
                            div -Class "day-item" -Attributes @{"data-time"="1652065200000";"tabindex"="0"} " 9"
                            div -Class "day-item" -Attributes @{"data-time"="1652151600000";"tabindex"="0"} "10"
                            div -Class "day-item" -Attributes @{"data-time"="1652238000000";"tabindex"="0"} "11"
                            div -Class "day-item" -Attributes @{"data-time"="1652324400000";"tabindex"="0"} "12"
                            div -Class "day-item" -Attributes @{"data-time"="1652410800000";"tabindex"="0"} "13"
                            div -Class "day-item" -Attributes @{"data-time"="1652497200000";"tabindex"="0"} "14"
                            div -Class "day-item" -Attributes @{"data-time"="1652583600000";"tabindex"="0"} "15"
                            div -Class "day-item" -Attributes @{"data-time"="1652670000000";"tabindex"="0"} "16"
                            div -Class "day-item" -Attributes @{"data-time"="1652756400000";"tabindex"="0"} "17"
                            div -Class "day-item" -Attributes @{"data-time"="1652842800000";"tabindex"="0"} "18"
                            div -Class "day-item" -Attributes @{"data-time"="1652929200000";"tabindex"="0"} "19"
                            div -Class "day-item" -Attributes @{"data-time"="1653015600000";"tabindex"="0"} "20"
                            div -Class "day-item" -Attributes @{"data-time"="1653102000000";"tabindex"="0"} "21"
                            div -Class "day-item" -Attributes @{"data-time"="1653188400000";"tabindex"="0"} "22"
                            div -Class "day-item" -Attributes @{"data-time"="1653274800000";"tabindex"="0"} "23"
                            div -Class "day-item" -Attributes @{"data-time"="1653361200000";"tabindex"="0"} "24"
                            div -Class "day-item" -Attributes @{"data-time"="1653447600000";"tabindex"="0"} "25"
                            div -Class "day-item" -Attributes @{"data-time"="1653534000000";"tabindex"="0"} "26"
                            div -Class "day-item" -Attributes @{"data-time"="1653620400000";"tabindex"="0"} "27"
                            div -Class "day-item" -Attributes @{"data-time"="1653706800000";"tabindex"="0"} "28"
                            div -Class "day-item" -Attributes @{"data-time"="1653793200000";"tabindex"="0"} "29"
                            div -Class "day-item" -Attributes @{"data-time"="1653879600000";"tabindex"="0"} "30"
                            div -Class "day-item" -Attributes @{"data-time"="1653966000000";"tabindex"="0"} "31"
                        }
                    }
                }
            }
            div -Class "container__tooltip"
        }
    }
}

$path = ".\ISAM_Console-1.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path