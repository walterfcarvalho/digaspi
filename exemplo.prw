#INCLUDE "PROTHEUS.CH"
User function exemplo
    /*  - cria a  pasta Protheus_data\_xmlSql
        - Salvar o arquivo "arquivo.xml lá"
    */


    Local oXmlSql	:= XmlSql():new("arquivo.XML") // carrega o objeto XmlSQL
	 
    Local cmd	:= oXmlSql:cSQL("getCliente", {"000001", "01"}) // metodo para "carregar o comando SQL"
  
    local cmd2  := oXmlSql:aArrC("campos2")


return "Ok"