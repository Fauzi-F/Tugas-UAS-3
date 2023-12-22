*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url_localhost}    http://localhost/MuhamadFauzi-SPK-MethodSAW/login.php

*** Keywords ***
Login Web
    Open Browser    ${url_localhost}    chrome
    Input Text    username    admin
    Input Text    password    admin
    Click Button     id:login
    Page Should Not Contain    Log in

Buka Sidebar
    Maximize Browser Window
    Click Element     id:sidebar-data

*** Test Cases ***
Login Web Gagal
    Open Browser    ${url_localhost}    chrome
    Input Text    username    admin
    Input Text    password    123
    Click Button     id:login
    Page Should Contain    Log in
    Close Browser

Login Web Berhasil
    Login Web


Isi Data Alternatif dan Logout
    Login Web
    Buka Sidebar
    Click Element     id:submenu-alternatif
    Click Button    id:add-alternatif
    Wait Until Element Contains    simpan-alternatif    Simpan
    Input Text    kandidat    Fauzi
    Click Button    id:simpan-alternatif
    Sleep    1.5s
    Click Element    id:logout