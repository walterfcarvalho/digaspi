#INCLUDE "PROTHEUS.CH"
User function APF
    Local aPergs    := {}
    Local aRt       := {}
    Local cPath     := space(500)
    Local bObrig    := .T.
    Local aCgetFile := {"*.xnu", "informe o diret�rio:", 1, "C:\", .f., GETF_LOCALHARD}
    
    aadd( aPergs, {6,"informar o diret�rio:", cPath, "", .T., "", 100, bObrig, "*.xnu", "C:\", aCgetFile}  )

    If ParamBox(aPergs ,"Parametros", aRt)


    endif



return "Ok"