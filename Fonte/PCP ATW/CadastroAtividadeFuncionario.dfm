�
 TFORMCADASTROATIVIDADEFUNCIONARIO 0|!  TPF0�!TFormCadastroAtividadeFuncionario FormCadastroAtividadeFuncionarioLeftcTop�Caption#   Cadastro Funcionários da AtividadeOldCreateOrder	PixelsPerInch`
TextHeight �
TScrollBoxScrollBoxFundo �TPanelPanelCentral �TPanelPanelFundoDados �TPanelPanel5 �TPageControlPagePrincipalTop-Height�
ActivePageTabSheetDadosPrincipaisTabIndex �	TTabSheetTabSheetConsulta �TDBGridDBGridListaHeightJColumnsExpanded	FieldName	FUNCA13IDWidthgVisible	 Expanded	FieldNameFUNCA60NOMEWidthVisible	 Expanded	FieldNameFUNCA10FONE1WidthYVisible	 Expanded	FieldNameFUNCA15SETORVisible	 Expanded	FieldNameFUNCN3VLRREMUNVisible	 Expanded	FieldNameFUNCN2PERCENCARGOSVisible	     �	TTabSheetTabSheetDadosPrincipais 	TGroupBox	GroupBox1Left Top Width�HeightyAlignalClientCaption   FuncionárioFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrder  TLabelLabel1LeftTop%WidthHeightCaptionFoneFocusControlDBEdit1  TLabelLabel3LeftTopIWidthOHeightCaption   RemuneraçãoFocusControlDBEdit3  TLabelLabel2Left� Top%WidthHeightCaptionSetorFocusControlDBEdit2  TLabelLabel4Left� TopKWidthCHeightCaption
% EncargosFocusControlDBEdit4  TSpeedButtonButtonFuncionarioLeft�TopWidthHeightHint$   Acessa Cadastro de Funcionário (F2)Flat	
Glyph.Data
�  �  BM�      6   (               h  �  �          � �� �� �� �� �� �� �� �� �� �� �� �� �� �  � �� �� �� �� �� �� �� �� �� �� �      � �  � �� �� �� �� �� �� �� �� �� �         � �  � �� �� �� �� �� �� �� �� �         � �� �  � �� �� �� �� �� �� �� �         � �� �� �  � �� ����?H@      ?8?oho      � �� �� �� �  � ����/0/p�������`po      � �� �� �� �� �  � �?@@�������������`po@H@� �� �� �� �� �  � �   �����ߠ����������   � �� �� �� �� �  � �   �����������������   � �� �� �� �� �  � �?@@��������ﯸ����p�?H@� �� �� �� �� �  � ����/0/�����ϯ����/00���� �� �� �� �� �  � �� ����?@@      ?H@���� �� �� �� �� �� �  � �� �� �� �� �� �� �� �� �� �� �� �� �� �  ParentShowHintShowHint	OnClickButtonFuncionarioClick  TRxDBLookupComboRxDBLookupCombo1LeftTopWidth�HeightHint:   Funcionário para a Atividade (F2 - Cadastro Funcionário)DropDownCountDisplayAllFields		DataField	FUNCA13ID
DataSource
DSTemplateDisplayEmpty...
EmptyValuenullFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style LookupField	FUNCA13IDLookupDisplayFUNCA13ID;FUNCA60NOMELookupDisplayIndexLookupSourcedsSQLFuncionario
ParentFontParentShowHintShowHint	TabOrder 	OnKeyDownRxDBLookupCombo1KeyDown  TDBEditDBEdit1LeftTop3Width� HeightBorderStylebsNone	DataFieldFUNCA10FONE1
DataSource
DSTemplateFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder  TDBEditDBEdit3LeftTopXWidth� HeightBorderStylebsNone	DataFieldFUNCN3VLRREMUN
DataSource
DSTemplateFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder  TDBEditDBEdit2Left� Top3Width� HeightBorderStylebsNone	DataFieldFUNCA15SETOR
DataSource
DSTemplateFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder  TDBEditDBEdit4Left� TopXWidth9HeightBorderStylebsNone	DataFieldFUNCN2PERCENCARGOS
DataSource
DSTemplateFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontTabOrder     �TPanelPanelMasterTop Height- TLabelLabel6Left`TopWidth7HeightCaption   DescriçãoFocusControlDBEdit6Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFont  TLabelLabel5LeftTopWidthHeightCaptionIdFocusControlDBEdit5Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFont  TLabelLabel7Left�TopWidthGHeightCaption   FuncionáriosFocusControlDBEdit8Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFont  TLabelLabel8Left�TopWidthzHeightCaption   Gasto c/ FuncionáriosFocusControlDBEdit7Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFont  TDBEditDBEdit6Left`TopWidth,Height	DataFieldPRATA60DESCR
DataSourceDSMasterTemplateTabOrder   TDBEditDBEdit5LeftTopWidthYHeight	DataField	PRATA13ID
DataSourceDSMasterTemplateTabOrder  TDBEditDBEdit7Left�TopWidthEHeight	DataFieldPRATN2GASTOFUNC
DataSourceDSMasterTemplateTabOrder  TDBEditDBEdit8Left�TopWidthEHeight	DataFieldPRATINROFUNC
DataSourceDSMasterTemplateTabOrder   �TPanelPanelCodigoDescricaoTop-Height       �TRxQuerySQLTemplateTagAfterDeleteSQLTemplateAfterDeleteSQL.Strings0Select * From PRODUCAOATIVFUNC Where (%MFiltro) and PRATA13ID = :PRATA13ID 	ParamDataDataType	ftUnknownName	PRATA13ID	ParamType	ptUnknown   TStringFieldSQLTemplatePRATA13IDDisplayLabelID Atividade	FieldName	PRATA13IDOriginDB.PRODUCAOATIVFUNC.PRATA13ID	FixedChar	Size  TIntegerFieldSQLTemplatePRAFICODTagDisplayLabel   Cód	FieldNamePRAFICODOriginDB.PRODUCAOATIVFUNC.PRAFICOD  TStringFieldSQLTemplateFUNCA13IDDisplayLabel   ID Funcionário	FieldName	FUNCA13IDOriginDB.PRODUCAOATIVFUNC.FUNCA13ID	FixedChar	Size  TDateTimeFieldSQLTemplateREGISTRODisplayLabelRegistro	FieldNameREGISTROOriginDB.PRODUCAOATIVFUNC.REGISTRO  TStringFieldSQLTemplatePENDENTEDisplayLabelPendente	FieldNamePENDENTEOriginDB.PRODUCAOATIVFUNC.PENDENTE	FixedChar	Size  TStringFieldSQLTemplateFUNCA60NOMEDisplayLabel
Nome Func.	FieldKindfkLookup	FieldNameFUNCA60NOMELookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCA60NOME	KeyFields	FUNCA13IDVisibleSize<Lookup	  TStringFieldSQLTemplateFUNCA10FONE1DisplayLabel
Fone Func.	FieldKindfkLookup	FieldNameFUNCA10FONE1LookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCA10FONE1	KeyFields	FUNCA13IDVisibleSize
Lookup	  TStringFieldSQLTemplateFUNCA15SETORDisplayLabelSetor Func.	FieldKindfkLookup	FieldNameFUNCA15SETORLookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCA15SETOR	KeyFields	FUNCA13IDVisibleSizeLookup	  TFloatFieldSQLTemplateFUNCN3VLRREMUNDisplayLabel   Vlr Remuneração	FieldKindfkLookup	FieldNameFUNCN3VLRREMUNLookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCN3VLRREMUN	KeyFields	FUNCA13IDVisibleLookup	  TFloatFieldSQLTemplateFUNCN2PERCENCARGOSDisplayLabel
% Encargos	FieldKindfkLookup	FieldNameFUNCN2PERCENCARGOSLookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCN2PERCENCARGOS	KeyFields	FUNCA13IDVisibleLookup	  TFloatFieldSQLTemplateFUNCN2CARGAHORDIA	FieldKindfkLookup	FieldNameFUNCN2CARGAHORDIALookupDataSetSQLFuncionarioLookupKeyFields	FUNCA13IDLookupResultFieldFUNCN2CARGAHORDIA	KeyFields	FUNCA13IDLookup	   TRxQuerySQLFuncionarioDatabaseNameDBSQL.Stringsselect * from FUNCIONARIO Macros LeftTop�  TStringFieldSQLFuncionarioFUNCA13IDDisplayLabelID	FieldName	FUNCA13IDOriginDB.FUNCIONARIO.FUNCA13ID	FixedChar	Size  TStringFieldSQLFuncionarioFUNCA60NOMEDisplayLabelNome	FieldNameFUNCA60NOMEOriginDB.FUNCIONARIO.FUNCA60NOME	FixedChar	Size<  TStringFieldSQLFuncionarioFUNCA10FONE1DisplayLabelFone	FieldNameFUNCA10FONE1OriginDB.FUNCIONARIO.FUNCA10FONE1	FixedChar	Size
  TStringFieldSQLFuncionarioFUNCA15SETORDisplayLabelSetor	FieldNameFUNCA15SETOROriginDB.FUNCIONARIO.FUNCA15SETOR	FixedChar	Size  	TBCDFieldSQLFuncionarioFUNCN3VLRREMUNDisplayLabel   Remuneração	FieldNameFUNCN3VLRREMUNOriginDB.FUNCIONARIO.FUNCN3VLRREMUN	PrecisionSize  	TBCDField SQLFuncionarioFUNCN2PERCENCARGOSDisplayLabel
% Encargos	FieldNameFUNCN2PERCENCARGOSOrigin!DB.FUNCIONARIO.FUNCN2PERCENCARGOS	PrecisionSize  	TBCDFieldSQLFuncionarioFUNCN2CARGAHORDIA	FieldNameFUNCN2CARGAHORDIAOrigin DB.FUNCIONARIO.FUNCN2CARGAHORDIA	PrecisionSize   TDataSourcedsSQLFuncionarioDataSetSQLFuncionarioLeft0Top�    