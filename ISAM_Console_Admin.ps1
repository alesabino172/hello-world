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
        Link -rel stylesheet -href "css/style.css"
        Link -rel stylesheet -href "css/styles2.css"
        #Link -rel stylesheet -href "css/bootstrap.min.css"
        Link -rel stylesheet -href "css/bootstrap-icons.css"
        script -src "js/all.min.js"
        #script -src "js/feather.min.js"
    }
    body -Class "nav-fixed" -Attributes @{ "cz-shortcut-listen"="true" } { 
        # Ini Nav
        nav -Class "topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" -id "sidenavAccordion" {
            # Sidenav Toggle Button
            button -Class "btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" -Id "sidebarToggle" {i -class "fas fa-bars" } 
            # Navbar Brand
            # * * Dica * * Você pode usar um texto ou uma imagem para sua marca navbar.
            # * * * * * *  Ao usar uma imagem, recomendamos o formato SVG.
            ## * * * * * * Dimensões: Maximum height: 32px, maximum width: 240px
            a -Class "navbar-brand pe-3 ps-4 ps-lg-2" -href "ISAM_Console.html" { "ISAM Console Admin" }
            # Navbar Search Input
            # * * Note: * * Visível apenas em e acima do ponto de interrupção lg
            Form -action "#" -Class "form-inline me-auto d-none d-lg-block me-3" -method post -Content {
                Div -Class "input-group input-group-joined input-group-solid" {
                    input -Class "form-control pe-0" -name "NavbarSearch" -type "search" -Attributes @{ "placeholder"="Procurar";"aria-label"="Search" }
                      Div -Class "input-group-text" { i -Class "fa-solid fa-magnifying-glass" } 
                }
            } -enctype "application/x-www-form-urlencoded" -target "_self"
            # Navbar Items
            ul -Class "navbar-nav align-items-center ms-auto" {
                # Documentation Dropdown
                li -Class "nav-item dropdown no-caret d-none d-md-block me-3" {
                    a -Class "nav-link dropdown-toggle" -Id "navbarDropdownDocs" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } {
                        Div -Class "fw-500" { "Documentação" }
                          i -Class "fa fa-chevron-right dropdown-arrow"
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
                                input -Class "form-control pe-0" -name "DropdownSearch" -type "text" -Attributes @{ "placeholder"="Procurar por...";"aria-label"="Search";"aria-describedby"="basic-addon2" }
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
                    a -Class "btn btn-icon btn-transparent-dark dropdown-toggle" -id "navbarDropdownUserImage" -href "javascript:void(0);" -Attributes @{ "role"="button";"data-bs-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false" } { img -Class "img-fluid" -src "./img/profiles/profile-2.png" }
                    Div -Class "dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" -Attributes @{ "aria-labelledby"="navbarDropdownUserImage" } {
                        h6 -Class "dropdown-header d-flex align-items-center" {
                            img -Class "dropdown-user-img" -src "./img/profiles/profile-2.png"
                            Div -Class "dropdown-user-details" {
                               Div -Class "dropdown-user-details-name" { "Alessandro Sabino" }
                               Div -Class "dropdown-user-details-email" { "alesabino@itau.com.br" }
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
        } # Fim Nav
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
                            Div -Class "sidenav-menu-heading" { "Central" }
                            # Sidenav Accordion (Dashboard)
                            a -Class "nav-link active" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseDashboards";"aria-expanded"="false";"aria-controls"="collapseDashboards" } {
                                Div -Class "nav-link-icon" { i -Class "bi bi-activity" -Attributes @{ "style"="font-weight: bold;" } }
                                "Dashboards"
                                Div -Class "sidenav-collapse-arrow" { i -Class "fa fa-angle-down" } #bi bi-chevron-down
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
                          Div -Class "sidenav-footer-title" { "AleSabino" }
                       }
                    }

                }
            }
        }
        script -src "./js/jquery-3.3.1.slim.min.js" 
        script -src "./js/bootstrap.bundle.min.js" 
        script -src "./js/scripts2.js"
        script -src "./js/sb-customizer.js"
        script -src "./js/chart-bar-demo.js"
        script -src "./js/chart-area-demo.js"
        script -src "./js/datatables-simple-demo.js"
        script -src "./js/simple-datatables@latest.js"
    }
}

$path = ".\ISAM_Console_Admin.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path

#https://sb-admin-pro.startbootstrap.com/tables.html