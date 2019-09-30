*** Settings ***
Library  ExcelLibrary
Library  Collections
*** Variables ***
${filepath}  C:\\Users\\anmol.srivastava\\Desktop\\DemoWebShopData.xlsx
@{all_data}
*** Keywords ***
Read from Excel File
    [Arguments]  ${row_index}
    Open Excel Document  filename=DemoWebShopData.xlsx  doc_id=${row_index}
    @{cre} =  Read Excel Row  row_num=${row_index}
    Close Current Excel Document
    [Return]  @{cre}    
   