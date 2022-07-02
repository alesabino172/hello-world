Import-Module PSHTML -Force

$HTMLPage = doctype
$HTMLPage += html -Attributes @{"lang"="pt-br"} {
    head {
        meta -charset "utf-8"
        meta -Attributes @{"http-equiv"="X-UA-Compatible"} -content_tag "IE=edge"
        meta -name "description" -content_tag ""
        meta -name "author" -content_tag ""
        meta -name "viewport" -content_tag "width=device-width, initial-scale=1, shrink-to-fit=no"
        Title { "ISAM Console Admin" }
        Link -rel stylesheet -href "css/style.css"
        Link -rel stylesheet -href "css/styles.css"
        Link -rel stylesheet -href "css/bootstrap-icons.css"
        script -src "js/all.min.js"
        #script -type text/javascript -src "js/datatables/datatables-custom.js"
        #Write-PSHTMLAsset -Name Chartjs
    }

    body -Class "nav-fixed" -Attributes @{ "cz-shortcut-listen"="true" } { 
        # Ini Nav
        Include -Name nav_ISAM_Console_Admin1
        # Fim Nav
        
        # Principal
        Div -Id "layoutSidenav" {
            Div -id "layoutSidenav_nav" {
                # Ini Menu
                include -Name layoutSidenav_nav_ISAM_Console_Admin1
                # Fim Menu
            }
            
            Div -id "layoutSidenav_content" {
                # Ini Main
                #include -Name content_Main_ISAM_Console_Admin1
                # Fim Main

                # Ini Footer
                #include -Name content_Footer_ISAM_Console_Admin1
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
        script -type text/javascript  -content "feather.replace();"
    }
}

$ScriptPath = Split-Path -Path $MyInvocation.MyCommand.Path
$ScriptPath = Split-Path -Path $PSScriptRoot
function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath
}
$ScriptPath = Get-ScriptDirectory

$path = Join-Path -Path $ScriptPath -ChildPath "\ISAM_Console_Admin.html"
$HTMLPage | Out-File -FilePath $path -Encoding utf8
Start $path
