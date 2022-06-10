Import-Module PSHTML -Force
$HTMLPage = html -Attributes @{"lang"="pt-br"} {
    head {
        meta -charset "utf-8"
        meta -Attributes @{"http-equiv"="X-UA-Compatible"} -content_tag "IE=edge"
        meta -name "viewport" -content_tag "width=device-width, initial-scale=1, shrink-to-fit=no"
        meta -name "description" -content_tag ""
        meta -name "author" -content_tag ""
        Title { "ISAM Console Admin 2" }
        Link -rel stylesheet -href "./css/style.css"
        Link -rel stylesheet -href "./css/styles.css"
        Link -rel stylesheet -href "./css/bootstrap.min.css"
        script -src "./js/all.js"
        Write-PSHTMLAsset -Name Chartjs
    }

    body -Class "sb-nav-fixed" { 
        nav -Class "sb-topnav navbar navbar-expand navbar-dark bg-dark" {
            # Alternância da barra lateral
            button -Class "btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" -Id "sidebarToggle" -Attributes @{"href"="#!"} { i -Class "fas fa-bars" }
            # NavBar Marca
            a -Class "navbar-brand ps-1" -href "ISAM_Console_Admin-2.html" { "ISAM Console" } 
            # Navbar Procurar           
            Form -action "#" -Class "form-inline me-auto mx-auto d-none d-lg-block me-3 my-2" -method post -Content {
                div -Class "input-group" {
                     input -name "btnNavbarSearch" -Class "form-control bg-dark text-primary" -Style "min-width:300px;" -type "text" -Attributes @{"placeholder"="Procurar...";"aria-label"="Procurar...";"aria-describedby"="btnNavbarSearch"}
                    button -Class "btn btn-outline-primary" -Id "btnNavbarSearch" -Attributes @{"type"="button"} { i -Class "fas fa-search" -id "iSearch" }
                }
            } -enctype "application/x-www-form-urlencoded" -target "_self"
            # Navbar
            ul -Class "navbar-nav ms-auto ms-md-0 me-3 me-lg-4" {
                li -Class "nav-item dropdown" {
                    a -Class "nav-link dropdown-toggle btn-outline-primary" -Id "navbarDropdown" -href "#" -Attributes @{"role"="button";"data-toggle"="dropdown";"aria-haspopup"="true";"aria-expanded"="false"} { i -Class "fas fa-user fa-fw" }
                    ul -Class "dropdown-menu dropdown-menu-right" -Attributes @{"aria-labelledby"="navbarDropdown"} {
                        li { a  -Class "dropdown-item" -href "#!"{ "Configurações" }}
                        li { a  -Class "dropdown-item" -href "#!"{ "Registro de atividade" }}
                        li { hr -Class "dropdown-divider" }
                        li { a  -Class "dropdown-item" -href "#!"{ "Sair" }}
                    }
                }
            }
        }
        div -Id "layoutSidenav1" {
            div -id "layoutSidenav_nav" {
                nav -Class "sidenav shadow-right sidenav-light" {
                    div -Class "sidenav-menu" {
                        div -Class "nav accordion" -id "accordionSidenav" {
                            # Sidenav Menu Heading (Account)
                            # * * Note: * * Visible only on and above the sm breakpoint
                            div -Class "sidenav-menu-heading d-sm-none" { "Account" }
                            # Sidenav Link (Alerts)
                            # * * Note: * * Visible only on and above the sm breakpoint
                            a -Class "nav-link d-sm-none" -href "#!" {
                                div -Class "nav-link-icon" { "feather feather-bell" }
                                "Alerts"
                                span -Class "badge bg-warning-soft text-warning ms-auto" { "4 New!" }
                            }
                            # Sidenav Link (Messages)
                            # * * Note: * * Visible only on and above the sm breakpoint
                            a -Class "nav-link d-sm-none" -href "#!" {
                                div -Class "nav-link-icon" { "feather feather-mail" }
                                "Messages"
                                span -Class "badge bg-success-soft text-success ms-auto" { "2 New!" }
                            }
                            # Sidenav Menu Heading (Core)
                            div -Class "sidenav-menu-heading" { "Core" }
                            # Sidenav Accordion (Dashboard)
                            a -Class "nav-link" -href "javascript:void(0);" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapseDashboards";"aria-expanded"="true";"aria-controls"="collapseDashboards" } {
                                div -Class "nav-link-icon" { "feather feather-activity" }
                                "Dashboards"
                                div -Class "sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                            }
                            div -Class "collapse show" -Id "collapseDashboards" -Attributes @{ "data-bs-parent"="#accordionSidenav" } {
                                nav -Class "sidenav-menu-nested nav accordion" -Id "accordionSidenavPages" {
                                    a -Class "nav-link" href="dashboard-1.html" {
                                        "Default"
                                        span -Class "badge bg-primary-soft text-primary ms-auto" { "Updated" }
                                    }
                                    a -Class "nav-link" -href "dashboard-2.html" { "Multipurpose" }
                                    a -Class "nav-link" -href "dashboard-3.html" { "Affiliate" }
                                }
                            }
                        }
                    }
                }
            }
        }
        div -Id "layoutSidenav" {
            div -Id "layoutSidenav_nav" {
                nav -Class "sb-sidenav accordion sb-sidenav-dark" -Id "sidenavAccordion" {
                    div -Class "sb-sidenav-menu" {
                        div -Class "nav" { 
                            div -Class "sb-sidenav-menu-heading" { "Principal" }
                            a -Class "nav-link" -href ".\ISAM_Console_Admin-2.html" {
                                div -Class "sb-nav-link-icon" { i -Class "fas fa-tachometer-alt" }
                                "Dashboard"
                            }
                            div -Class "sb-sidenav-menu-heading" { "Interface" }
                            a -Class "nav-link dropdown-toggle" -href "#" -Attributes @{"data-toggle"="dropdown";"data-bs-target"="#collapseLayouts";"aria-expanded"="false";"aria-controls"="collapseLayouts"} {
                                #div -Class "sb-nav-link-icon" { i -Class "fas fa-columns" }
                                "Layouts"
                                div -Class "sb-sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                            }
                            div -Class "collapse" -Id "collapseLayouts" -Attributes @{"aria-labelledby"="headingOne";"data-bs-parent"="#sidenavAccordion"} {
                                nav -Class "sb-sidenav-menu-nested nav" {
                                    a -Class "nav-link" -href "layout-static.html" { "Static Navigation" }
                                    a -Class "nav-link" -href "layout-sidenav-light.html" { "Light Sidenav" }
                                }
                            } 
                            a -Class "nav-link collapsed" -href "#" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#collapsePages";"aria-expanded"="false";"aria-controls"="collapsePages" } {
                                div -Class "sb-nav-link-icon" { i -Class "fas fa-book-open" } 
                                "Páginas"
                                div -Class "sb-sidenav-collapse-arrow" { i -Class "fas fa-angle-down" } 
                            }
                            div -Class "collapse" -Id "collapsePages" -Attributes @{ "aria-labelledby"="headingTwo";"data-bs-parent"="#sidenavAccordion" } {
                                nav -Class "sb-sidenav-menu-nested nav accordion" -Id "sidenavAccordionPages" {
                                    a -Class "nav-link collapsed" -href "#" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseAuth";"aria-expanded"="false";"aria-controls"="pagesCollapseAuth" } {
                                        "Autenticação"
                                        div -Class "sb-sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    div -Class "collapse" -Id "pagesCollapseAuth" -Attributes @{ "aria-labelledby"="headingOne";"data-bs-parent"="#sidenavAccordionPages" } {
                                        nav -Class "sb-sidenav-menu-nested nav" {
                                            a -Class "nav-link" -href "login.html" { "Login" }
                                            a -Class "nav-link" -href "register.html" { "Registro" }
                                            a -Class "nav-link" -href "password.html" { "Esqueceu a senha" }
                                        }
                                    }
                                    a -Class "nav-link collapsed" -href "#" -Attributes @{ "data-bs-toggle"="collapse";"data-bs-target"="#pagesCollapseError";"aria-expanded"="false";"aria-controls"="pagesCollapseError" } {
                                       "Error"
                                       div -Class "sb-sidenav-collapse-arrow" { i -Class "fas fa-angle-down" }
                                    }
                                    div -class "collapse" -id "pagesCollapseError" -Attributes @{ "aria-labelledby"="headingOne";"data-bs-parent"="#sidenavAccordionPages" } {
                                        nav -Class "sb-sidenav-menu-nested nav" {
                                           a -Class "nav-link" -href "401.html" { "401 Page" }
                                           a -Class "nav-link" -href "404.html" { "404 Page" }
                                           a -Class "nav-link" -href "500.html" { "500 Page" }
                                        }
                                    }
                                }
                            }
                            div -Class "sb-sidenav-menu-heading" { "Complementos" }
                            a -Class "nav-link" -href "charts.html" {
                               div -Class "sb-nav-link-icon" { i -Class "fa fa-file-text" }
                               "Relatórios"
                            }

                            a -Class "nav-link" -href "charts.html" {
                               div -Class "sb-nav-link-icon" { i -Class "fas fa-chart-area" }
                               "Gráficos"
                            }
                            a -Class "nav-link" -href "tables.html" {
                               div -Class "sb-nav-link-icon" { i -Class "fas fa-table" }
                               "Tabelas"
                            }
                        }
                    }
                    div -Class "sb-sidenav-footer" {
                        div -Class "small" { "Logado como:" }
                        "Admin ISAM"
                    }
                }
            }

            div -Id "layoutSidenav_content" -Class "bg-secondary"{
                div -Id "Main" {
                    header -Class "jumbotron jumbotron-fluid bg-dark text-white" {
                        div -Class "container" {
                            div -Class "col-auto mt-4" {
                                h1 -Class "display-4 pb-2 mt-4 mb-2 border-bottom" { 
                                    i -Class "mr-2 fas fa-tachometer-alt"
                                    "Dashboard" 
                                 }
                                 p -Class "lead" { "Console de adminstração dos appliances do ISAM" }
                                 #div -Class "p-3 mb-2 bg-secondary text-white" { ".bg-primary" }
                            }
                        }
                    }

                    div -Class "container-fluid px-4" {
                        div -Class "row" {
                            div -Class "col-xl-3 col-md-6" {
                                div -Class "card border border-light bg-primary text-light mb-4" {
                                    div -Class "card-body" { 
                                        h5 -Class "card-title" { "Cartão de Primário" }
                                        p  -Class "card-text"  { "Um exemplo de texto rápido para construir o título do card e fazer preencher o conteúdo do card." }
                                    }
                                    div -Class "card-footer d-flex align-items-center justify-content-between" {
                                        a -Class "small text-white stretched-link" -href "#" { "Ver detalhes" }
                                        div -Class "small text-white" { i -class "fas fa-angle-right" }
                                    }
                                }
                            }
                            div -Class "col-xl-3 col-md-6" {
                                div -Class "card border border-light bg-warning text-light mb-4" {
                                    div -Class "card-body" { 
                                        h5 -Class "card-title" { "Cartão de Aviso" }
                                        p  -Class "card-text"  { "Um exemplo de texto rápido para construir o título do card e fazer preencher o conteúdo do card." }
                                    }
                                    div -Class "card-footer d-flex align-items-center justify-content-between" {
                                        a -Class "small text-white stretched-link" -href "#" { "Ver detalhes" }
                                        div -Class "small text-white" { i -Class "fas fa-angle-right" } 
                                    }
                                }
                            }
                            div -Class "col-xl-3 col-md-6" {
                                div -Class "card border border-light bg-success text-light mb-4" {
                                    div -Class "card-body" { 
                                        h5 -Class "card-title" { "Cartão de Sucesso" }
                                        p  -Class "card-text"  { "Um exemplo de texto rápido para construir o título do card e fazer preencher o conteúdo do card." }
                                    }
                                    div -Class "card-footer d-flex align-items-center justify-content-between" {
                                        a -Class "small text-white stretched-link" -href "#" { "Ver detalhes" }
                                        div -Class "small text-white" { i -Class "fas fa-angle-right" }
                                    }
                                }
                            }
                            div -Class "col-xl-3 col-md-6" {
                                div -Class "card border border-light bg-danger text-light mb-4" {
                                    div -Class "card-body" { 
                                        h5 -Class "card-title" { "Cartão de Perigo" }
                                        p  -Class "card-text"  { "Um exemplo de texto rápido para construir o título do card e fazer preencher o conteúdo do card." }
                                    }
                                    div -Class "card-footer d-flex align-items-center justify-content-between" {
                                        a -Class "small text-white stretched-link" -href "#" { "Ver detalhes" }
                                        div -Class "small text-white" { i -class "fas fa-angle-right" }
                                    }
                                }
                            }
                        }

                        div -Class "row" {
                            div -Class "container-fluid" {
                               div -Class "shadow-sm card mb-4" {
                                   div -Class "card-header" { 
                                        i -Class "fas fa-tachometer-alt" 
                                        " Page Header Overlap" 
                                   }
                                   div -Class "card-body" {
                                       "The page header by default uses the <code>.pb-10</code> spacing utility classes to add paddig to the bottom of the <code>.page-header</code>. 
                                        Then, the first container within the <code>main</code> element uses the <code>.mt-n10</code> spacing utility to give the container an equivilant, negative top margin to create the overlap effect."
                                   }
                               }
                            }

                            div -Class "col-xl-6" {
                                div -Class "shadow-sm card mb-4" {
                                    div -Class "card-header" { 
                                        i -Class "fas fa-tachometer-alt" 
                                        " Page Header Overlap" 
                                    }
                                    div -Class "card-body" {
                                        "The page header by default uses the <code>.pb-10</code> spacing utility classes to add paddig to the bottom of the <code>.page-header</code>. 
                                        Then, the first container within the <code>main</code> element uses the <code>.mt-n10</code> spacing utility to give the container an equivilant, negative top margin to create the overlap effect."
                                    }
                                }
                            }

                            div -Class "col-xl-6" {
                                div -Class "shadow-sm card mb-4" {
                                    div -Class "card-header" { 
                                        i -Class "fas fa-tachometer-alt" 
                                        " Page Header Overlap" 
                                    }
                                    div -Class "card-body" {
                                        "The page header by default uses the <code>.pb-10</code> spacing utility classes to add paddig to the bottom of the <code>.page-header</code>. 
                                        Then, the first container within the <code>main</code> element uses the <code>.mt-n10</code> spacing utility to give the container an equivilant, negative top margin to create the overlap effect."
                                    }
                                }
                            }
                            div -Class "col-xl-6" {
                               div -Class "card mb-4" {
                                  div -Class "card-header" {
                                     i -Class "fas fa-chart-area me-1"
                                     "Exemplo de gráfico de área"
                                  }
                                  div -Class "card-body" { canvas -Id "myAreaChart" -Width "100%" -Height "40" }
                               }
                            }
                            div -Class "col-xl-6" {
                               div -Class "card mb-4" {
                                  div -Class "card-header" {
                                      i -Class "fas fa-chart-bar me-1"
                                      "Exemplo de gráfico de barras"
                                  }
                                  div -Class "card-body" { canvas -Id "myBarChart" -Width "100%" -Height "40" }
                               }
                            }
                        }
                        div -Class "card mb-4" {
                            div -Class "card-header" {
                               i -Class "fas fa-table me-1"
                               "Exemplo de tabela de dados"
                            }
                            Div -Class "card-body" {
                                Table -Id "datatablesSimple" -Class "table table-striped table-dark"{
                                    Thead {
                                        tr {
                                            th "Appliance HostName"
                                            th "Appliance IP"
                                            th "Reverse Proxy"
                                            th "Status"
                                            th "Data/Hora"
                                            th "Salário"
                                        }
                                    }
                                    tfoot {
                                        tr {
                                            th "Appliance HostName"
                                            th "Appliance IP"
                                            th "Reverse Proxy"
                                            th "Status"
                                            th "Data/Hora"
                                            th "Salário"
                                        }
                                    }
                                    Tbody {
                                        tr {
                                            td "acxxp3115cld.itau"
                                            td "10.225.48.102"
                                            td "Edinburgh"
                                            td "61"
                                            td "2011/04/25"
                                            td "`$320,800"
                                        }
                                        tr {
                                            td "acxxp3116cld.itau"
                                            td "10.225.48.108"
                                            td "Tokyo"
                                            td "63"
                                            td "2011/07/25"
                                            td "`$170,750"
                                        }
                                        tr {
                                            td "acxxp3135cld.itau"
                                            td "10.225.48.152"
                                            td "San Francisco"
                                            td "66"
                                            td "2009/01/12"
                                            td "`$86,000"
                                        }
                                        tr {
                                            td "acxxp3136cld.itau"
                                            td "10.225.48.158"
                                            td "Edinburgh"
                                            td "22"
                                            td "2012/03/29"
                                            td "`$433,060"
                                        }
                                        tr {
                                            td "acxxp3111cld.rse.itau"
                                            td "192.168.79.230"
                                            td "Tokyo"
                                            td "33"
                                            td "2008/11/28"
                                            td "`$162,700"
                                        }
                                        tr {
                                            td "acxxp3112cld.rse.itau"
                                            td "192.168.79.234"
                                            td "New York"
                                            td "61"
                                            td "2012/12/02"
                                            td "`$372,000"
                                        }
                                        tr {
                                            td "acxxp3131cld.rse.itau"
                                            td "192.168.79.238"
                                            td "San Francisco"
                                            td "59"
                                            td "2012/08/06"
                                            td "`$137,500"
                                        }
                                        tr {
                                            td "acxxp3132cld.rse.itau"
                                            td "192.168.79.242"
                                            td "Tokyo"
                                            td "55"
                                            td "2010/10/14"
                                            td "`$327,900"
                                        }
                                        tr {
                                            td "acxxp3113cld.rsv.itau"
                                            td "10.59.98.56"
                                            td "San Francisco"
                                            td "39"
                                            td "2009/09/15"
                                            td "`$205,500"
                                        }
                                        tr {
                                            td "acxxp3114cld.rsv.itau"
                                            td "10.59.98.64"
                                            td "Edinburgh"
                                            td "23"
                                            td "2008/12/13"
                                            td "`$103,600"
                                        }
                                        tr {
                                            td "acxxp3133cld.rsv.itau"
                                            td "10.59.98.88"
                                            td "London"
                                            td "30"
                                            td "2008/12/19"
                                            td "`$90,560"
                                        }
                                        tr { 
                                            td "acxxp3134cld.rsv.itau"
                                            td "10.59.98.96"
                                            td "Edinburgh"
                                            td "22"
                                            td "2013/03/03"
                                            td "`$342,000"
                                        }
                                        tr { 
                                            td "Charde Marshall"
                                            td "Diretor regional"
                                            td "San Francisco"
                                            td "36"
                                            td "2008/10/16"
                                            td "`$470,600"
                                        }
                                        tr { 
                                            td "Haley Kennedy"
                                            td "Designer de Marketing Sênior"
                                            td "London"
                                            td "43"
                                            td "2012/12/18"
                                            td "`$313,500"
                                        }
                                        tr { 
                                            td "Tatyana Fitzpatrick"
                                            td "Diretor regional"
                                            td "London"
                                            td "19"
                                            td "2010/03/17"
                                            td "`$385,750"
                                        }
                                        tr { 
                                            td "Michael Silva"
                                            td "Designer de Marketing"
                                            td "London"
                                            td "66"
                                            td "2012/11/27"
                                            td "`$198,500"
                                        }
                                        tr { 
                                            td "Paul Byrd"
                                            td "Diretor Financeiro (CFO)"
                                            td "New York"
                                            td "64"
                                            td "2010/06/09"
                                            td "`$725,000"
                                        }
                                        tr { 
                                            td "Gloria Little"
                                            td "Administrador de sistemas"
                                            td "New York"
                                            td "59"
                                            td "2009/04/10"
                                            td "`$237,500"
                                        }
                                        tr { 
                                            td "Bradley Greer"
                                            td "Engenheiro de software"
                                            td "London"
                                            td "41"
                                            td "2012/10/13"
                                            td "`$132,000"
                                        }
                                        tr { 
                                            td "Dai Rios"
                                            td "Líder de Pessoal"
                                            td "Edinburgh"
                                            td "35"
                                            td "2012/09/26"
                                            td "`$217,500"
                                        }
                                        tr { 
                                            td "Jenette Caldwell"
                                            td "Líder de Desenvolvimento"
                                            td "New York"
                                            td "30"
                                            td "2011/09/03"
                                            td "`$345,000"
                                        }
                                        tr { 
                                            td "Yuri Berry"
                                            td "Diretor de marketing (CMO)"
                                            td "New York"
                                            td "40"
                                            td "2009/06/25"
                                            td "`$675,000"
                                        }
                                        tr { 
                                            td "Caesar Vance"
                                            td "Suporte pré-vendas"
                                            td "New York"
                                            td "21"
                                            td "2011/12/12"
                                            td "`$106,450"
                                        }
                                        tr { 
                                            td "Doris Wilder"
                                            td "Assistente de vendas"
                                            td "Sidney"
                                            td "23"
                                            td "2010/09/20"
                                            td "`$85,600"
                                        }
                                        tr { 
                                            td "Angelica Ramos"
                                            td "Diretor executivo (CEO)"
                                            td "London"
                                            td "47"
                                            td "2009/10/09"
                                            td "`$1,200,000"
                                        }
                                        tr { 
                                            td "Gavin Joyce"
                                            td "Desenvolvedor"
                                            td "Edinburgh"
                                            td "42"
                                            td "2010/12/22"
                                            td "`$92,575"
                                        }
                                        tr { 
                                            td "Jennifer Chang"
                                            td "Regional Diretor"
                                            td "Singapore"
                                            td "28"
                                            td "2010/11/14"
                                            td "`$357,650"
                                        }
                                        tr { 
                                            td "Brenden Wagner"
                                            td "Engenheiro de software"
                                            td "San Francisco"
                                            td "28"
                                            td "2011/06/07"
                                            td "`$206,850"
                                        }
                                        tr { 
                                            td "Fiona Green"
                                            td "Diretor de Operações (COO)"
                                            td "San Francisco"
                                            td "48"
                                            td "2010/03/11"
                                            td "`$850,000"
                                        }
                                        tr { 
                                            td "Shou Itou"
                                            td "Marketing Regional"
                                            td "Tokyo"
                                            td "20"
                                            td "2011/08/14"
                                            td "`$163,000"
                                        }
                                        tr { 
                                            td "Michelle House"
                                            td "Especialista em Integração"
                                            td "Sidney"
                                            td "37"
                                            td "2011/06/02"
                                            td "`$95,400"
                                        }
                                        tr { 
                                            td "Suki Burks"
                                            td "Desenvolvedor"
                                            td "London"
                                            td "53"
                                            td "2009/10/22"
                                            td "`$114,500"
                                        }
                                        tr { 
                                            td "Prescott Bartlett"
                                            td "Autor técnico"
                                            td "London"
                                            td "27"
                                            td "2011/05/07"
                                            td "`$145,000"
                                        }
                                        tr { 
                                            td "Gavin Cortez"
                                            td "Líder da equipe"
                                            td "San Francisco"
                                            td "22"
                                            td "2008/10/26"
                                            td "`$235,500"
                                        }
                                        tr { 
                                            td "Martena Mccray"
                                            td "Suporte pós-venda"
                                            td "Edinburgh"
                                            td "46"
                                            td "2011/03/09"
                                            td "`$324,050"
                                        }
                                        tr { 
                                            td "Unity Butler"
                                            td "Designer de Marketing"
                                            td "San Francisco"
                                            td "47"
                                            td "2009/12/09"
                                            td "`$85,675"
                                        }
                                        tr { 
                                            td "Howard Hatfield"
                                            td "Gerente"
                                            td "San Francisco"
                                            td "51"
                                            td "2008/12/16"
                                            td "`$164,500"
                                        }
                                        tr { 
                                            td "Hope Fuentes"
                                            td "Secretário"
                                            td "San Francisco"
                                            td "41"
                                            td "2010/02/12"
                                            td "`$109,850"
                                        }
                                        tr { 
                                            td "Vivian Harrell"
                                            td "Controlador financeiro"
                                            td "San Francisco"
                                            td "62"
                                            td "2009/02/14"
                                            td "`$452,500"
                                        }
                                        tr { 
                                            td "Timothy Mooney"
                                            td "Gerente"
                                            td "London"
                                            td "37"
                                            td "2008/12/11"
                                            td "`$136,200"
                                        }
                                        tr { 
                                            td "Jackson Bradshaw"
                                            td "Diretor"
                                            td "New York"
                                            td "65"
                                            td "2008/09/26"
                                            td "`$645,750"
                                        }
                                        tr { 
                                            td "Olivia Liang"
                                            td "Engenheiro de suporte"
                                            td "Singapore"
                                            td "64"
                                            td "2011/02/03"
                                            td "`$234,500"
                                        }
                                        tr { 
                                            td "Bruno Nash"
                                            td "Engenheiro de software"
                                            td "London"
                                            td "38"
                                            td "2011/05/03"
                                            td "`$163,500"
                                        }
                                        tr { 
                                            td "Sakura Yamamoto"
                                            td "Engenheiro de suporte"
                                            td "Tokyo"
                                            td "37"
                                            td "2009/08/19"
                                            td "`$139,575"
                                        }
                                        tr { 
                                            td "Thor Walton"
                                            td "Desenvolvedor"
                                            td "New York"
                                            td "61"
                                            td "2013/08/11"
                                            td "`$98,540"
                                        }
                                        tr { 
                                            td "Finn Camacho"
                                            td "Engenheiro de suporte"
                                            td "San Francisco"
                                            td "47"
                                            td "2009/07/07"
                                            td "`$87,500"
                                        }
                                        tr { 
                                            td "Serge Baldwin"
                                            td "Coordenador de dados"
                                            td "Singapore"
                                            td "64"
                                            td "2012/04/09"
                                            td "`$138,575"
                                        }
                                        tr { 
                                            td "Zenaida Frank"
                                            td "Engenheiro de software"
                                            td "New York"
                                            td "63"
                                            td "2010/01/04"
                                            td "`$125,250"
                                        }
                                        tr { 
                                            td "Zorita Serrano"
                                            td "Engenheiro de software"
                                            td "San Francisco"
                                            td "56"
                                            td "2012/06/01"
                                            td "`$115,000"
                                        }
                                        tr { 
                                            td "Jennifer Acosta"
                                            td "Desenvolvedor Javascript Júnior"
                                            td "Edinburgh"
                                            td "43"
                                            td "2013/02/01"
                                            td "`$75,650"
                                        }
                                        tr { 
                                            td "Cara Stevens"
                                            td "Assistente de vendas"
                                            td "New York"
                                            td "46"
                                            td "2011/12/06"
                                            td "`$145,600"
                                        }
                                        tr { 
                                            td "Hermione Butler"
                                            td "Diretor regional"
                                            td "London"
                                            td "47"
                                            td "2011/03/21"
                                            td "`$356,250"
                                        }
                                        tr { 
                                            td "Lael Greer"
                                            td "Administrador de sistemas"
                                            td "London"
                                            td "21"
                                            td "2009/02/27"
                                            td "`$103,500"
                                        }
                                        tr { 
                                            td "Jonas Alexander"
                                            td "Desenvolvedor"
                                            td "San Francisco"
                                            td "30"
                                            td "2010/07/14"
                                            td "`$86,500"
                                        }
                                        tr { 
                                            td "Shad Decker"
                                            td "Diretor regional"
                                            td "Edinburgh"
                                            td "51"
                                            td "2008/11/13"
                                            td "`$183,000"
                                        }
                                        tr { 
                                            td "Michael Bruce"
                                            td "Desenvolvedor Javascript"
                                            td "Singapore"
                                            td "29"
                                            td "2011/06/27"
                                            td "`$183,000"
                                        }
                                        tr { 
                                            td "Donna Snider"
                                            td "Suporte ao cliente"
                                            td "New York"
                                            td "27"
                                            td "2011/01/25"
                                            td "`$112,000"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                footer -Class "py-4 bg-light mt-auto" {
                    div -Class "container-fluid px-4" {
                        div -Class "d-flex align-items-center justify-content-between small" {
                            div -Class "text-muted" { "Copyright &copy; Your Website 2022" }
                            div {
                                a -href "#" { "Política de Privacidade" }
                                "&middot;"
                                a -href "#" { "Termos &amp; Condições" }
                            }
                       }
                    }
                }
            }
        }

        script -src "./js/jquery-3.3.1.slim.min.js"
        script -src "./js/bootstrap.bundle.min.js"
        script -src "./js/scripts.js"
        script -src "./js/chart-bar-demo.js"
        script -src "./js/chart-area-demo.js"
        script -src "./js/datatables-simple-demo.js"
        script -src "./js/simple-datatables@latest.js"
        
        #$Pages = "home.html","login.html","about.html"
        #nav -Content {
        #    foreach($page in $pages){
        #        a -href "\$($page)" -Target _blank
        #    }
        #
        #} -Class "mainnavigation" -Style "border 1px"
    }
}
#<!DOCTYPE html>
$path = "D:\Documentos\Desenv\PowerShell\ISAM_Console_Admin-2.1.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path