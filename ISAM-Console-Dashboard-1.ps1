Import-Module PSHTML -Force

$HTMLPage = doctype
$HTMLPage += html -Attributes @{"lang"="pt-br"} {
    head {
        Write-PSHTMLAsset
        meta -charset "utf-8"
        meta -Attributes @{"http-equiv"="X-UA-Compatible"} -content_tag "IE=edge"
        meta -name "description" -content_tag ""
        meta -name "author" -content_tag ""
        meta -name "viewport" -content_tag "width=device-width, initial-scale=1, shrink-to-fit=no"
        Title { "ISAM Console Admin 2" }
        Link -rel stylesheet -href "./css/dashboard.css"
        style {$css} -type "text/css"
    }

    body {
        header -Class "navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" {
            a -Class "navbar-brand col-md-3 col-lg-2 me-0 px-3" -href "#" { "ISAM Console Admin" }
            button -Class "navbar-toggler position-absolute d-md-none collapsed" -Attributes @{"type"="button"; "data-bs-toggle"="collapse";"data-bs-target"="#sidebarMenu";"aria-controls"="sidebarMenu";"aria-expanded"="false";"aria-label"="Toggle navigation"} { 
                span -class "navbar-toggler-icon" {}
            }
            input -Name "Search" -Class "form-control form-control-dark w-100" -type "text" -Attributes @{"placeholder"="Pesquisar";"aria-label"="Pesquisar"}
            div -Class "navbar-nav" {
                div -Class "nav-item text-nowrap" {
                    a -Class "nav-link px-3" -href "#" { "Sair" }
                }
            }
        }
        div -Class "container-fluid" {
            div -Class "row" {
                nav -Id "sidebarMenu" -Class "col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" {
                    div -Class "position-sticky pt-3" {
                        ul -Class "nav flex-column" {
                            li -Class "nav-item" {
                                a -Class "nav-link active" -href "#" -Attributes @{"aria-current"="page"} {
                                    span -Attributes @{"data-feather"="home"} {}
                                    " Dashboard"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                    span -Attributes @{"data-feather"="file"} {}
                                    " Pedidos"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                    span -Attributes @{"data-feather"="shopping-cart"} {}
                                    " Produtos"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                    span -Attributes @{"data-feather"="users"} {}
                                    " Clientes"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                    span -Attributes @{"data-feather"="bar-chart-2"} {}
                                    " Relatórios"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                    span -Attributes @{"data-feather"="layers"} {}
                                    " Integrações"
                                }
                            }
                        }

                        h6 -class "sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted" {
                            span "Saved reports"
                            a -class "link-secondary" -href "#" -Attributes @{"aria-label"="Add a new report"} {
                                span -Attributes @{"data-feather"="plus-circle"}
                            }
                        }
                        ul -Class "nav flex-column mb-2" {
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                   span -Attributes @{"data-feather"="file-text"}
                                   " Mês atual"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                   span -Attributes @{"data-feather"="file-text"}
                                   " Ultimo quarto"
                                }
                            }
                            li -Class "nav-item" {
                                a -class "nav-link" -href "#" {
                                   span -Attributes @{"data-feather"="file-text"}
                                   " Compromisso social"
                                }
                            }
                            li -Class "nav-item" {
                                a -Class "nav-link" -href "#" {
                                   span -Attributes @{"data-feather"="file-text"}
                                   " Venda de fim de ano"
                                }
                            }
                        }
                    }
                }
                
                div -Class "col-md-9 ms-sm-auto col-lg-10 px-md-4" {
                    div -Class "d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" {
                        h1 -Class "h2" { 
                            "Dashboard" 
                        }
                        p "Console de adminstração dos appliances do ISAM"
                        div -Class "btn-toolbar mb-2 mb-md-0" {
                            div -Class "btn-group me-2" {
                                button -Attributes @{"type"="button"} -Class "btn btn-sm btn-outline-secondary" { "Compartilhar" }
                                button -Class "btn btn-sm btn-outline-secondary" { "Exportar" }
                            }
                            button -Attributes @{"type"="button"} -Class "btn btn-sm btn-outline-secondary dropdown-toggle" {
                                span -Attributes @{"data-feather"="calendar"}  
                                "Essa Semana"
                            }
                        }
                    }
                    
                    canvas -Class "my-4 w-100" -Id "myChart" -Width "900" -Height "380"

                    h2 "Section title"

                    Div -Class "table-responsive" {
                        Table -Class "table table-striped table-sm" {
                          Thead {
                            tr {
                              th -Attributes @{"scope"="col"} { "#" }
                              th -Attributes @{"scope"="col"} { "Header" }
                              th -Attributes @{"scope"="col"} { "Header" }
                              th -Attributes @{"scope"="col"} { "Header" }
                              th -Attributes @{"scope"="col"} { "Header" }
                            }
                          }
                          Tbody {
                            tr {
                              td { "1,001"       }
                              td { "random"      }
                              td { "data"        }
                              td { "placeholder" }
                              td { "text"        }
                            }
                            tr {
                              td { "1,002"       }
                              td { "placeholder" }
                              td { "irrelevant"  }
                              td { "visual"      }
                              td { "layout"      }
                            }
                            tr {
                              td { "1,003"     }
                              td { "data"      }
                              td { "rich"      }
                              td { "dashboard" }
                              td { "tabular"   }
                            }
                            tr {
                              td { "1,003"        }
                              td { "information"  }
                              td { "placeholder"  }
                              td { "illustrative" }
                              td { "data"         }
                            }
                            tr {
                              td { "1,004"     }
                              td { "text"      }
                              td { "random"    }
                              td { "layout"    }
                              td { "dashboard" }
                            }
                            tr {
                              td { "1,005"       }
                              td { "dashboard"   }
                              td { "irrelevant"  }
                              td { "text"        }
                              td { "placeholder" }
                            }
                            tr {
                              td { "1,006"        }
                              td { "dashboard"    }
                              td { "illustrative" }
                              td { "rich"         }
                              td { "data"         }
                            }
                            tr {
                              td { "1,007"       }
                              td { "placeholder" }
                              td { "tabular"     }
                              td { "information" }
                              td { "irrelevant"  }
                            }
                            tr {
                              td { "1,008"       }
                              td { "random"      }
                              td { "data"        }
                              td { "placeholder" }
                              td { "text"        }
                            }
                            tr {
                              td { "1,009"       }
                              td { "placeholder" }
                              td { "irrelevant"  }
                              td { "visual"      }
                              td { "layout"      }
                            }
                            tr {
                              td { "1,010"     }
                              td { "data"      }
                              td { "rich"      }
                              td { "dashboard" }
                              td { "tabular"   }
                            }
                            tr {
                              td { "1,011"        }       
                              td { "information"  }  
                              td { "placeholder"  }  
                              td { "illustrative" } 
                              td { "data"         }         
                            }
                            tr {
                              td { "1,012"       }
                              td { "text"        }
                              td { "placeholder" }
                              td { "layout"      }
                              td { "dashboard"   }
                            }
                            tr {
                              td { "1,013"      }
                              td { "dashboard"  }
                              td { "irrelevant" }
                              td { "text"       }
                              td { "visual"     }
                            }
                            tr {
                              td { "1,014"        }
                              td { "dashboard"    }
                              td { "illustrative" }
                              td { "rich"         }
                              td { "data"         }
                            }
                            tr {
                              td { "1,015"       }
                              td { "random"      }
                              td { "tabular"     }
                              td { "information" }
                              td { "text"        }
                            }
                          }
                        }
                    }

                }
            }
        }
        script -type text/javascript  -content "feather.replace();"
        script -src "./js/dashboard.js"


        #$Pages = "home.html","login.html","about.html"
        #nav -Content {
        #    foreach($page in $pages){
        #        a -href "\$($page)" -Target _blank
        #    }
        #
        #} -Class "mainnavigation" -Style "border 1px"
    }
}

$path = ".\ISAM_Console_Dashboard-1.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path