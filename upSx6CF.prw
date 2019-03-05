#include 'protheus.ch'
#include 'parmtype.ch'

user function upsx6cf()
	Local o := xmlSql():new("MOE.xml")
	private cNumPed := ''
	private cCod := ''
	private cNnParam:= space(20)
	private cVlParam:= space(20)
	private lMuda := .F.
	private cVlAnt := space(20)

	cNumPed := ''
	cCod := ''

	DEFINE MSDIALOG oDlg TITLE "Consulta Parametro:" from 0,0 to 150,300 PIXEL
	oFont2  := TFont():New("Arial",,16,,.F.,,,,,.F.,.F.)
	oFont3  := TFont():New("Arial",,16,,.F.,,,,,.F.,.T.)


	oSayCod	:= TSay():New( 015,020,{||"Parametro:"},,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
	oGetCod := TGet():New( 010,050,{|u|If(PCount()>0,cNnParam:=u,cNnParam)},,100,015,'@!', {|| getParam() },,,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cNumPed",,)


	oSayCod	:= TSay():New( 035,020,{||"ValorAntigo:"},,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
	oGetCod := TGet():New( 030,050,{|u|If(PCount()>0,cNnParam:=u,cVlAnt)},,100,015,'@!', {|| getParam() },,,oFont3,,,.T.,"",,,.F.,.F.,,.T.,.F.,"","cNumPed",,)


	oSayCod	:= TSay():New( 055,020,{||"Valor:"},,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
	oGetCod := TGet():New( 050,050,{|u|If(PCount()>0,cVlParam:=u,cVlParam)},,100,015,'@!', {|| gravaParam() },,,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cVlParam",,)

	ACTIVATE MSDIALOG oDlg CENTERED
return nil


static function getParam
	cVlAnt := getmv(cNnParam)
	lMuda := .T.
return

static function gravaParam
	local cMsg:= "Confirma a mudança do valor ?" +CHR(13)+CHR(10)+ "Parametro:"+ alltrim(cNnParam) + CHR(13) + CHR(10)+ "Valor:" + alltrim(cVlParam)

	if lMuda == .T.
		if MSGYESNO(cMsg, "") = .T.
			PUTMV(alltrim(cNnParam), alltrim(cVlParam))
			lMuda := .F.
			endIf
	endIf
return "ok"

