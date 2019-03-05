#include 'protheus.ch'
#include 'parmtype.ch'


user function cogeidx()
    Local aOpr  := {"=", "<>", ">", "<", ">=", "<=", "contem"}
    Local cTb
    Local cCampo
    Local aTables
    Local aCp
    Local aIndexes
    Local aStru
	Local oFont  := TFont():New("Courrier new",, 14,,.F.,,,,,.F.,.F.)


    Private oDlg
    Private oLsTb
    Private oCampos
    Private oIndexs
    Private oOpr

    DEFINE MSDIALOG oDlg TITLE "Consulta generica indexada." from 0,0 to 250, 600 PIXEL

    aTables := getTables()
    cTb     := space(len(aTables[1]))  
    aCp     := {}
    aStru   := {}

    // objeto com as tabelas
	@ 002, 002 SAY oSay1 PROMPT "Tabela:" SIZE 040, 007 OF oDlg COLORS 0, 16777215 PIXEL
    oLsTb   := TComboBox():New(010,002,{|u|if(PCount()>0,cTb:=u,cTb)}, aTables,200,20,oDlg,,{|| getCampos(cTb, @aCp, @aStru), getIndexes(cTb)} ,,,,.T.,oFont,,,,,,,, cTb)

    // lista dos indices
	@ 025, 002 SAY oSay1 PROMPT "Indices:" SIZE 040, 007 OF oDlg COLORS 0, 16777215 PIXEL
    aIndexes:= {}
    oIndexs := TComboBox():New(032,002,{|u|if(PCount()>0,cCampo:=u,cCampo)}, aIndexes, 150, 20,oDlg,, {|| Alert("mudou de campo")  };
    ,,,,.T.,oFont,,,,,,,, )


    // objeto com os campos da tabela
	@ 047, 002 SAY oSay1 PROMPT "Campos:" SIZE 040, 007 OF oDlg COLORS 0, 16777215 PIXEL
    cCampo  := ""
    oCampos := TComboBox():New(054, 002, {|u|if(PCount()>0,cCampo:=u,cCampo)}, aCp, 150,20,oDlg,, {|| Alert("mudou de campo")  },,,,.T.,oFont,,,,,,,, )



	ACTIVATE MSDIALOG oDlg CENTERED
    



return

static function getTables()
    Local aTables := {}

    DbSelectArea("SX2")
    DbSetOrder(1)
    
    while SX2->(EOF()) = .f.
        aadd(aTables, SX2->X2_CHAVE + " - " + SX2->X2_NOME )
        SX2->(DbSkip())
    endDo

return aTables


static function getCampos(cTb, aCp, aStru)
    aCp     := {}
    aStru   := {}

    DbSelectArea("SX3")
    DbSetOrder(1)
    DbSeek(Substr(cTb,01,03))

    while SX3->X3_ARQUIVO == Substr(cTb,01,03)
        aadd(aCp, SX3->X3_CAMPO + ' - ' + SX3->X3_DESCRIC )
        aadd(aStru, {SX3->X3_CAMPO, SX3->X3_TIPO, SX3->X3_PICTURE} )
        SX3->(DbSkip())
    endDo

    oCampos:SetItems(aCp)
    oCampos:refresh()
return

static function getIndexes(cTb)
    Local aIdx := {}

    DbSelectArea("SIX")
    DbSetOrder(1)
    DbSeek(Substr(cTb,01,03))

    while SIX->INDICE == Substr(cTb,01,03)
        aadd(aIdx, SIX->CHAVE)
        SIX->(DbSkip())
    endDo

    oIndexs:SetItems(aIdx)
    oIndexs:refresh()
return
