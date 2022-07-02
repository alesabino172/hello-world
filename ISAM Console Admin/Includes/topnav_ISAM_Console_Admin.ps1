
nav -Class "topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" -id "sidenavAccordion" {
    # Sidenav Toggle Button
    button -Class "btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" -Id "sidebarToggle" { i -class "fas fa-bars" } 
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
                        Div -Class "dropdown-user-details-email" { "alessandrosabino@correio.itau.com.br" }
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
