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
        Link -rel stylesheet -href "BootStrap Exemplo/sb-admin-pro.startbootstrap.com/css/litepicker.css"
        Link -rel stylesheet -href "css/bootstrap-icons.css"
        #Link -rel stylesheet -href "css/fontawesome.min.css"
        script -src "js/all.min.js"
        script -src "js/feather.min.js"
        script -type text/javascript -src "BootStrap Exemplo/sb-admin-pro.startbootstrap.com/js/datatables/datatables-custom.js"
        Write-PSHTMLAsset -Name Jquery
        Write-PSHTMLAsset -Name Chartjs
    }

    body -Class "nav-fixed" -Attributes @{ "cz-shortcut-listen"="true" } { 
        nav -Class "topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" -id "sidenavAccordion" {
            # Sidenav Toggle Button
            button -Class "btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" -Id "sidebarToggle" { i -Attributes @{"data-feather"="menu"} }
            # Navbar Brand
            # * * Tip * * You can use text or an image for your navbar brand.
            # * * * * * * When using an image, we recommend the SVG format.
            ## * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px
            a -Class "navbar-brand pe-3 ps-4 ps-lg-2" -href "index.html" { "ISAM Console Admin" }
            # Navbar Search Input
            # * * Note: * * Visible only on and above the lg breakpoint
            Form -action "#" -Class "form-inline me-auto d-none d-lg-block me-3" -method post -Content {
                Div -Class "input-group input-group-joined input-group-solid" {
                    input -Class "form-control pe-0" -name "NavbarSearch" -type "search" -Attributes @{ "placeholder"="Search";"aria-label"="Search" }
                      Div -Class "input-group-text" { i -Attributes @{"data-feather"="search"} }
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
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Attributes @{"data-feather"="book"} } 
                            Div {
                                Div -Class "small text-gray-500" { "Documentação" }
                                " Instruções de uso e referência "
                            }
                        }
                        Div -Class "dropdown-divider m-0" 
                        a -Class "dropdown-item py-3" -href "https://docs.startbootstrap.com/sb-admin-pro/components" -Target "_blank" {
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Attributes @{"data-feather"="code"} }
                            Div {
                                Div -Class "small text-gray-500" { "Componentes" }
                                " Trechos de código e referência "
                            }
                        }
                        Div -Class "dropdown-divider m-0"
                        a -Class "dropdown-item py-3" -href "https://docs.startbootstrap.com/sb-admin-pro/changelog" -Target "_blank" {
                            Div -Class "icon-stack bg-primary-soft text-primary me-4" { i -Attributes @{"data-feather"="file-text"} } 
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
                    a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -Id "searchDropdown" -href "#" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Attributes @{"data-feather"="search"} }
                    # Lista suspensa - Pesquisar
                    Div -Class "dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="searchDropdown" } {
                        Form -action "#" -Class "form-inline me-auto w-100" -method post -Content {
                            Div -Class "input-group input-group-joined input-group-solid" {
                                input -Class "form-control pe-0" -name "DropdownSearch" -type "text" -Attributes @{ "placeholder"="Search for...";"aria-label"="Search";"aria-describedby"="basic-addon2" }
                                  Div -Class "input-group-text" { i -Attributes @{"data-feather"="search"} }
                            }
                        } -enctype "application/x-www-form-urlencoded" -target "_self"
                    }
                }
                # Lista suspensa de alertas
                li -Class "nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications" {
                      a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -Id "navbarDropdownAlerts" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Attributes @{"data-feather"="bell"} } 
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownAlerts" } {
                        h6 -Class "dropdown-header dropdown-notifications-header" {
                            i -Class "me-2" -Attributes @{"data-feather"="bell"}
                            "Central de alertas"
                        }
                        # Alerta de exemplo 1
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-warning" { i -Attributes @{"data-feather"="activity"} }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "29 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Esta é uma mensagem de alerta. Não é nada sério, mas requer sua atenção." }
                           }
                        }
                        # Alerta de exemplo 2
                        a -Class  "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-info" { i -Attributes @{"data-feather"="bar-chart"} }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "22 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Um novo relatório mensal está pronto. Clique aqui para ver!" }
                            }
                        }
                        # Alerta de exemplo 3
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                            Div -Class "dropdown-notifications-item-icon bg-danger" { i -Class "fas fa-exclamation-triangle" }
                            Div -Class "dropdown-notifications-item-content" {
                                Div -Class "dropdown-notifications-item-content-details" { "8 de dezembro de 2021" }
                                Div -Class "dropdown-notifications-item-content-text" { "Falha crítica do sistema, sistemas desligando." }
                            }
                        }
                        # Alerta de exemplo 4
                        a -Class "dropdown-item dropdown-notifications-item" -href "#!" {
                           Div -Class "dropdown-notifications-item-icon bg-success" { i -Attributes @{"data-feather"="user-plus"} }
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
                      a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -id "navbarDropdownMessages" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { i -Attributes @{"data-feather"="mail"} }
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownMessages" } {
                        h6 -Class "dropdown-header dropdown-notifications-header" {
                            i -Class "me-2" -Attributes @{"data-feather"="mail"}
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
                    a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -id "navbarDropdownUserImage" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { img -Class "img-fluid" -src "./img/profiles/profile-2.png" }
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownUserImage" } {
                        h6 -Class "dropdown-header d-flex align-items-center" {
                            img -Class "dropdown-user-img" -src "./img/profiles/profile-2.png"
                            Div -Class "dropdown-user-details" {
                               Div -Class "dropdown-user-details-name" { "Alessandro Sabino" }
                               Div -Class "dropdown-user-details-email" { "alessandrosabino@correio.itau.com.br" }
                            }
                        }
                        Div -Class "dropdown-divider"
                        a -Class "dropdown-item" -href "#!" {
                            Div -Class "dropdown-item-icon" { i -Attributes @{"data-feather"="settings"} }
                            "Conta"
                        }
                        a -Class "dropdown-item" -href "#!" {
                            Div -Class "dropdown-item-icon"{ i -Attributes @{"data-feather"="log-out"} }
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
                            # Sidenav Menu Heading (Core)
                            Div -Class "sidenav-menu-heading" { "Inicio" }
                            # Sidenav Accordion (Dashboard)
                            a -Class "nav-link active" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseDashboards";"aria-expanded"="false";"aria-controls"="collapseDashboards" } {
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="activity";"style"="font-weight: bold;" } }
                                "Dashboards"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } 
                            }
                            Div -Class "collapse show" -Id "collapseDashboards" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -Id "accordionSidenavPages" {
                                    a -Class "nav-link active" -href "dashboard-1.html" {
                                        "Principal"
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
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="grid"} }
                                "Páginas"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } 
                            }
                            Div -Class "collapse" -id "collapsePages" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -id "accordionSidenavPagesMenu" {
                                    # Acordeão Sidenav aninhado (Páginas -> Conta)
                                    a -Class "nav-link collapsed" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAccount";"aria-expanded"="false";"aria-controls"="pagesCollapseAccount" } {
                                        "Conta"
                                        Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" }
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
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="globe"} } 
                                "Aplicações"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" } 
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
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="repeat"} } 
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
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="layout"} } 
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
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="package"} }
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
                               Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="tool"} }
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
                               Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="bar-chart"} }
                               "Gráficos"
                            }
                            # Sidenav Link (Tables)
                            a -Class "nav-link" -href "tables.html" {
                                Div -Class "nav-link-icon" { i -Attributes @{"data-feather"="filter"} }
                                "Tabelas"
                            }

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
            }
            Div -id "layoutSidenav_content" {
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
                footer -Class "footer-admin mt-auto footer-light" {
                   div -Class "container-xl px-4" {
                      div -Class "row" {
                         div -Class "col-md-6 small" { "Direitos autorais © Seu site 2021" }
                         div -Class "col-md-6 text-md-end small" {
                             a -href "dashboard-1.html#!" { "Política de Privacidade" }
                             "·"
                             a -href "dashboard-1.html#!" { "Termos &amp; Condições" }
                         }
                      }
                   }
                }
            }
        }
        script -src "js/bootstrap.bundle.min.js"
        script -src "js/scripts2.js"
        script -src "js/Chart.min.js" 
        script -src "js/chart-area-demo2.js"
        script -src "js/chart-bar-demo2.js"
        script -src "js/datatables-simple-demo.js"
        script -src "js/simple-datatables@latest.js"
        script -src "js/bundle.js"
        script -src "js/litepicker.js"
        script -src "js/sb-customizer.js"
        script -type text/javascript -src "BootStrap Exemplo/sb-admin-pro.startbootstrap.com/js/datatables/datatables-custom.js" 
        script -type text/javascript -content "
            alert('Olá, Mundo!');
        "
    }
}

$path = ".\ISAM_Console.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path