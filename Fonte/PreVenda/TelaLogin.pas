unit TELALOGIN;
interface
uses
  VarSYS, JPEG, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBTables, ConerBtn, Grids, DBGrids,
  DBCtrls, Placemnt, RxQuery, RXCtrls, Variants;
type
  TFormTelaLogin = class(TForm)
    FormStorage: TFormStorage;
    DSTblTerminal: TDataSource;
    SQLTerminal: TRxQuery;
    SQLTerminalTERMICOD: TIntegerField;
    SQLTerminalTERMCTIPO: TStringField;
    SQLTerminalTERMCSTATUSCAIXA: TStringField;
    SQLTerminalTERMDSTATUSCAIXA: TDateTimeField;
    SQLTerminalTERMA60DESCR: TStringField;
    SQLTerminalTERMCATIVO: TStringField;
    SQLTerminalECFA13ID: TStringField;
    SQLTerminalTERMA60NOMECOMPUT: TStringField;
    RxLabel2: TLabel;
    RxLabel1: TLabel;
    ComboPDV: TDBLookupComboBox;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    BtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    EditTerminal: TEdit;
    SQLTerminalEMPRICOD: TIntegerField;
    SQLTerminalTERMA30MODIMPNFISC: TStringField;
    SQLTerminalTERMA60MODLEITOR: TStringField;
    SQLTerminalTERMCDISPOENTRADA: TStringField;
    SQLTerminalTERMA5LEITPORTACOM: TStringField;
    Image1: TImage;
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    LblRetorno: TRxLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboPDVExit(Sender: TObject);
    procedure EditSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    JPG : TJPEGImage ;
    BMP : TBitMap;
    NumTentativas:Integer;
  public
    { Public declarations }
  end;
var
  FormTelaLogin: TFormTelaLogin;
implementation

uses DataModulo, UnitLibrary;

{$R *.DFM}

procedure TFormTelaLogin.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel ;
end;

procedure TFormTelaLogin.BtnOkClick(Sender: TObject);
begin
  if ComboPDV.Text = '' then
  begin
    Informa('Selecione o Terminal');
    ComboPDV.SetFocus;
    Exit;
  end ;

  if not (SQLTerminalEMPRICOD.Value > 0) then
  begin
    Informa('N�o h� nehuma Empresa Padr�o selecionada para o terminal,  o sistema n�o pode iniciar!');
    ComboPDV.SetFocus;
    ModalResult := mrCancel ;
    Exit;
  end ;

  if (not DM.SQLUsuario.Locate('USUAA60LOGIN', EditUsuario.Text, [])) and (Application.FindComponent('FormTelaItens') = Nil) then
  begin
    Informa('Usu�rio n�o cadastrado');
    EditUsuario.SetFocus;
    Exit;
  end ;

  if (Application.FindComponent('FormTelaItens') = Nil) then
    begin
      if SQLTerminal.RecordCount = 0 then
      begin
        ModalResult := mrOk ;
      end
      else begin
        if DM.SQLUsuarioUSUAA5SENHA.Value = EditSenha.Text then
        begin
          ModalResult := mrOk ;
        end
        else begin
          Informa('Senha Inv�lida');
          Inc(NumTentativas) ;
          if NumTentativas = 3 then
            ModalResult := mrCancel
          else
            EditSenha.SetFocus ;

          exit ;
        end ;
      end ;
    end
    else
      begin
        ModalResult := mrOk;
      end;

  EmpresaPadrao     := SQLTerminalEMPRICOD.AsString;
  DM.UsuarioAtual   := DM.SQLUsuarioUSUAICOD.AsInteger;
  UsuarioMaster := False;
  if DM.SQLUsuarioUSUACUSERMASTER.AsString = 'S' then
    UsuarioMaster := True
  else
    UsuarioMaster := False;

  UsuarioCorrente   := DM.SQLUsuarioUSUAICOD.AsInteger;
  UsuarioAtualNome  := DM.SQLUsuarioUSUAA60LOGIN.AsString;
  TerminalAtual     := SQLTerminalTERMICOD.AsInteger;
  // IMPRESSORA NAO FISCAL
  ImpNaoFiscalAtual := '';
  PortaImpNaoFiscalAtual := '';
  if SQLTerminalTERMA30MODIMPNFISC.AsString <> '' then
    begin
      ImpNaoFiscalAtual      := SQLTerminalTERMA30MODIMPNFISC.AsString;
      PortaImpNaoFiscalAtual := 'LPT1';
    end
  else
    begin
      ImpNaoFiscalAtual      := '';
      PortaImpNaoFiscalAtual := '';
    end;

  //////////////////////////////////////////////

  //LEITOR DE COD. DE BARRAS
  if SQLTerminalTERMCDISPOENTRADA.AsString = 'L' then
    if SQLTerminalTERMA60MODLEITOR.AsString <> '' then
      begin
        LeitorCodigoBarras      := SQLTerminalTERMA60MODLEITOR.AsString;
        PortaLeitorCodigoBarras := SQLTerminalTERMA5LEITPORTACOM.AsString;
      end
    else
      begin
        LeitorCodigoBarras      := '';
        PortaLeitorCodigoBarras := '';
      end;
  //////////////////////////////////////////////////////////

  if DM.SQLUsuarioUSUAN2PERCDESC.Value > 0 then
      PercDesqMaxUsario := DM.SQLUsuarioUSUAN2PERCDESC.Value
    else
      PercDesqMaxUsario := 0 ;

  if not AlterarUsuario then
  begin
    TerminalAtual     := SQLTerminalTERMICOD.AsInteger ;

    if TerminalAtual = TerminalCorrente then
      begin
        Informa('O terminal selecionado j� est� ativo, opera��o cancelada !');
        Abort;
      end;

    TerminalAtualNome := SQLTerminalTERMA60DESCR.Value ;
    TerminalAtualData := SQLTerminalTERMDSTATUSCAIXA.AsString ;
    TerminalModo      := SQLTerminalTERMCTIPO.Value ;
    EmpresaCorrente   := SQLTerminalEMPRICOD.AsInteger;
    TerminalCorrente  := TerminalAtual ;

    if DM.SQLEmpresa.Locate('EMPRICOD', EmpresaCorrente, []) then
      MatrizFilial := DM.SQLEmpresa.FieldByName('EMPRCMATRIZFILIAL').AsString ;

    //FILTRAR TERMINAL ATIVO
    DM.SQLTerminalAtivo.Close ;
    DM.SQLTerminalAtivo.MacroByName('MFiltro').Value := 'TERMICOD = ' + IntToStr(TerminalAtual) ;
    DM.SQLTerminalAtivo.Open ;
    //SETAR DADOS ECF
    PortaECFAtual := DM.SQLTerminalAtivoTERMA5ECFPORTACOM.Value; // Esta Linha foi colocada aqui pq alguns clientes querem abrir a gaveta sem trocar de terminal
    if DM.SQLTerminalAtivoECFA13ID.AsString <> '' then
    begin
      DM.SQLTemplate.Close ;
      DM.SQLTemplate.SQL.Clear ;
      DM.SQLTemplate.SQL.Add('select * from ECF') ;
      DM.SQLTemplate.SQL.Add('where ECFA13ID = "' + DM.SQLTerminalAtivoECFA13ID.AsString + '"') ;
      DM.SQLTemplate.Open ;
      if not DM.SQLTemplate.IsEmpty then
      begin
        if DM.SQLTemplate.FieldByNAme('ECFA5IDENTIFICADORCNFV').AsString = '' then
        begin
          Informa('O Comprovante N�o Fiscal Vinculado n�o foi informado. Podem ocorrer problemas no fechamento do cupom !') ;
        end ;

        if DM.SQLTemplate.FieldByNAme('ECFA5IDENTIFICADORCNFNV').AsString = '' then
        begin
          Informa('O Comprovante N�o Fiscal N�o Vinculado n�o foi informado. Podem ocorrer problemas na autentica��o !') ;
        end ;

        if DM.SQLTemplate.FieldByNAme('ECFA2TRIBTXCRED').AsString = '' then
        begin
          Informa('O Tributo para Taxa de Credi�rio n�o foi informado no cadastro de ECF�s. Podem ocorrer problemas na finaliza��o do cupom!') ;
        end;

        Ecf_ID        := DM.SQLTemplate.FieldByNAme('ECFA13ID').Value ;
        ECFAtual      := DM.SQLTemplate.FieldByNAme('ECFA30MODELO').Value ;
        if DM.SQLTerminalAtivoTERMINROVIASTEF.AsInteger <= 0 then
          NroViasTEF    := 1
        else
          NroViasTEF    := DM.SQLTerminalAtivoTERMINROVIASTEF.Value;
        Ecf_CNFV      := DM.SQLTemplate.FieldByNAme('ECFA5IDENTIFICADORCNFV').Value;
        Ecf_CNFNV     := DM.SQLTemplate.FieldByNAme('ECFA5IDENTIFICADORCNFNV').Value;
        TributoTaxaCrediario := DM.SQLTemplate.FieldByNAme('ECFA2TRIBTXCRED').Value;

        //CamImprMatr := SQLTerminalTERMA60PATHIMPRMATR.Value ;
        if (ECFAtual <> '') and (PortaECFAtual = '') then
        begin
          Informa('A porta serial do ECF n�o est� configurada, o sistema n�o ir� funcionar corretamente!') ;
          ModalResult := mrCancel ;
          exit ;
        end ;
      end ;
    end
    else begin
      Ecf_ID        := '' ;
      ECFAtual      := '' ;
      Ecf_CNFV      := '' ;
      Ecf_CNFNV     := '' ;
      NroViasTEF    := 0;
      TributoTaxaCrediario := '';
    end ;

    if TerminalModo = '' then
    begin
      Informa('O Tipo de terminal n�o foi informado, o sistema n�o pode iniciar !') ;
      ModalResult := mrCancel ;
      exit ;
    end ;

    {if not DM.BloquearTerminal(IntToStr(DM.UsuarioAtual), IntToStr(TerminalAtual)) then
    begin
      Informa('Este terminal j� est� ativo !') ;
      ModalResult := mrCancel ;
      exit ;
    end ;}
  end ;
  AlterarUsuario := false ;
end ;

procedure TFormTelaLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree ;
end;

procedure TFormTelaLogin.FormCreate(Sender: TObject);
begin
  FormStorage.IniFileName := Application.Title + '.ini' ;
  FormStorage.IniSection  := Name ;
  FormStorage.Active      := true ;

  if RetornarNomeComputador = '' then
  begin
    Informa('N�o foi poss�vel Descobrir o nome deste computador, a execu��o do sistema ser� cancelada!') ;
    Halt ;
    exit ;
  end ;

  SQLTerminal.Close ;
  SQLTerminal.MacroByName('MFiltro').Value := 'TERMA60NOMECOMPUT = "' + AnsiUpperCase(RetornarNomeComputador) + '"';
  SQLTerminal.Open ;

  if SQLTerminal.EOF then
  begin
    Informa('N�o h� nenhum terminal configurado para ser usado neste computador !') ;
    Halt ;
    exit ;
  end ;

  NumTentativas := 0 ;

  // VERIFICA CONFIGURACOES DE ESTOQUE PARA EVITAR TRANSTORNOS NO ESTOQUE POR
  // FALTA DE PARAMETROS NO SISTEMA.
  if not DM.SQLConfigVenda.Active then DM.SQLConfigVenda.Open;
  // VERIFICA CONFIGURACOES DE CUPOM
  if DM.SQLTerminalAtivoTERMCMOVESTOQUE.AsString = 'S' then
    begin
      if DM.SQLConfigVendaOPESICODCUPOM.AsVariant = Null then
        begin
          Informa('A opera��o padr�o de estoque para "VENDA" de cupom n�o foi configurada, o sistema ser� fechado!');
          Halt;
          Exit;
        end
      else
        begin
          if SQLLocate('OPERACAOESTOQUE','OPESICOD','OPESCENTRADASAIDA',DM.SQLConfigVendaOPESICODCUPOM.AsString) <> 'S' then
            begin
              Informa('A opera��o de estoque selecionada para "VENDA" de cupom n�o � do tipo "SAIDA", favor verifique. O sistema ser� fechado!');
              Halt;
              Exit;
            end;
        end;
      if DM.SQLConfigVendaOPESICODCANCCUPOM.AsVariant = Null then
        begin
          Informa('A opera��o padr�o de estoque para "CANCELAMENTO" de cupom n�o foi configurada, o sistema ser� fechado!');
          Halt;
          Exit;
        end
      else
        begin
          if SQLLocate('OPERACAOESTOQUE','OPESICOD','OPESCENTRADASAIDA',DM.SQLConfigVendaOPESICODCANCCUPOM.AsString) <> 'E' then
            begin
              Informa('A opera��o de estoque selecionada para "CANCELAMENTO" de cupom n�o � do tipo "ENTRADA", favor verifique. O sistema ser� fechado!');
              Halt;
              Exit;
            end;
        end;
    end;
end;

procedure TFormTelaLogin.FormStorageRestorePlacement(Sender: TObject);
begin
  try
    if EditTerminal.Text <> '' then
      ComboPDV.KeyValue := EditTerminal.Text ;
  except
    Application.ProcessMessages ;
  end ;
end;

procedure TFormTelaLogin.FormShow(Sender: TObject);
begin
  //FECHAR TELA DE SPLASH
  if Application.FindComponent('FormTelaSplash') <> nil then
    (Application.FindComponent('FormTelaSplash') as TForm).Close ;

  Application.ProcessMessages ;

  if (ComboPDV.KeyValue <> '') then
  begin
    if (EditUsuario.Text <> '') and (DM.SQLUsuario.Locate('USUAA60LOGIN', EditUsuario.Text,[])) then
      EditSenha.SetFocus
    else
      EditUsuario.SetFocus ;
  end
  else ComboPDV.SetFocus ;
End ;

procedure TFormTelaLogin.FormKeyPress(Sender: TObject; var Key: Char);
Var
  Objeto:TComponent;
begin
  if Key=char(13) Then
    begin
      Objeto:=(Sender as TForm).ActiveControl;
      //If (Objeto is TDBLookUpComboBox) AND (Objeto as TDBLookUpComboBox).IsDropDown Then Begin (Objeto as TDBLookUpComboBox).CloseUp(True);Application.ProcessMessages;End;
      Key:=CHR(0);
      Perform(Wm_NextDlgCtl,0,0);
    End;
end;

procedure TFormTelaLogin.EditSenhaExit(Sender: TObject);
begin
  { if (EditSenha.Text <> '') Then
    if (DM.SQLUsuarioUSUAA5SENHA.Value = EditSenha.Text) then
    begin
    end
    else
      begin
        Informa('Senha Inv�lida');
        Inc(NumTentativas) ;
        if NumTentativas = 3 Then
          ModalResult := mrCancel
        else
          EditSenha.SetFocus;
      End;}
end;

procedure TFormTelaLogin.FormActivate(Sender: TObject);
begin
  FormTelaLogin.Caption := 'Bem Vindo ao ' + Application.Title ;

  if Application.FindComponent('FormTelaItens') <> nil then
    begin
      ComboPDV.Setfocus ;
      EditUsuario.Enabled := False;
      EditSenha.Enabled   := False;
      EditSenha.Text := Dm.SQLUsuarioUSUAA5SENHA.AsString;
    end;
end;

procedure TFormTelaLogin.ComboPDVExit(Sender: TObject);
begin
  if (Sender as TDBLookUpComboBox).Text <> '' then
    EditTerminal.Text := IntToStr((Sender as TDBLookUpComboBox).KeyValue) ;
end;

procedure TFormTelaLogin.EditSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_RETURN then
//    BtnOk.Click;
end;

end.
