*** Settings ***
Library  SeleniumLibrary
Library    DateTime



*** Variables ***
${Data_Atual}
${Reserva_3_dias}
${ButtonVerificarDisponibilidade} 
${Input_calendar-selected-checkin}



*** Keywords ***
Abrir Site
    Open Browser  https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/  chrome
    ${Data_Atual}    Get Current Date    
    ${Reserva_3_dias}    Add Time To Date    ${Data_Atual}    3 days
    ${Reserva_3_dias}    Convert Date    ${Reserva_3_dias}    result_format=%d/%m/%y
    Log To Console    ${Reserva_3_dias}

Verificar Disponibilidade   
    # Input Text    //span[@id="calendar-selected-checkin"]    ${Reserva_3_dias}     
    # Input Text    //span[@id="calendar-selected-checkout"]    ${Reserva_3_dias}    
    # Click Element    //span[@id="calendar-selected-checkin"]
    # Click Element    //span[@id="calendar-selected-checkout"]
    # Click Button    Verificar Disponibilidade

Adicionar Adultos e Criança
    Open Browser  https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/reservation?checkin=2022-12-02&checkout=2022-12-06&adults=1&child1=0&child2=0&child3=0&resident=0/  chrome
    Select From List By Label    label=form-select    2
    Select From List By Label    name= faixa1    1
    Click Button    Adicionar
  
Adicionar ao Carrinho
    Open Browser  https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/reservation?checkin=2022-12-02&checkout=2022-12-06&adults=1&child1=0&child2=0&child3=0&resident=0/  chrome
    Click Button    Continuar

Informar Hospedes
    Open Browser    https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/step3
    Click Button    Hóspedes
    Input Text    Nome    Paulo
    Input Text    Nome    Maria
    Input Text    Nome    Julia
    Click Button    Salvar
    Select From List By Value    label=CASAL
    Select From List By Value    id=arrivalTime    01:00 - 02:00
    Click Button    Continuar


Efetuar Pagamento
    Open Browser  https://reservas.desbravador.com.br/hotel-app/hotel-teste-desbravador-8050/checkout
    Input Text    E-mail    teste@teste.com.br
    Input Text    Primeiro Nome    Jose
    Input Text    Sobrenome    Roberto
    Select From List By Value    name=documentType    CPF
    Input Text    name=document    000.000.000-22
    Input Text    name=telephone    5100000000
    Select From List By Value    id=react-select-3-placeholder    Brasil
    Input Text    name=state    Distrito Federal
    Input Text    name=city    Brasília
    Input Text    name=number    4000 0000 0000 0044
    Input Text    name=name    DESBRAVADOR SOFTWARE
    Input Text    name=expiry    12/23
    Input Text    name=cvc    123
    Click Button    id=recaptcha-anchor-label
    Click Element    //*[contains(text(),"Concordo com as políticas do hotel")]
    Click Button    Finalizar



*** Test Cases ***
Cenário 1: Reservas Desbravador
    Abrir Site
Verificar Disponibilidade
    Verificar Disponibilidade
Adicionar Adultos e Criança
    Adicionar Adultos e Criança
Adicionar ao Carrinho
    Adicionar ao Carrinho
Informar Hospedes
    Informar Hospedes
Efetuar Pagamento
    Efetuar Pagamento









