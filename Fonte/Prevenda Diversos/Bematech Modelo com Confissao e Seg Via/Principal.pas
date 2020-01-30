unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, VarSys, ExtCtrls, ComCtrls, RDprint, Inifiles;

type
  TFormPrincipal = class(TForm)
    TblPedidoFinanceiro: TTable;
    TblPedidoFinanceiroPedICod: TStringField;
    TblPedidoFinanceiroVencimento: TDateField;
    TblPedidoFinanceiroValor: TFloatField;
    TblPreVendaItem: TTable;
    TblPreVendaItemCodigo: TIntegerField;
    TblPreVendaItemDescricao: TStringField;
    TblPreVendaItemQuantidade: TFloatField;
    TblPreVendaItemValorUnitario: TFloatField;
    TblPreVendaItemValorTotal: TFloatField;
    TblPreVendaItemDesconto: TFloatField;
    TblPreVendaItemMarca: TStringField;
    TblPreVendaItemReferencia: TStringField;
    TblPreVendaCab: TTable;
    TblPreVendaCabTicketNumero: TStringField;
    TblPreVendaCabVendedor: TStringField;
    TblPreVendaCabPlano: TStringField;
    TblPreVendaCabCliente: TStringField;
    TblPreVendaCabFoneCliente: TStringField;
    TblPreVendaCabTotalNominal: TFloatField;
    TblPreVendaCabTaxaCrediario: TFloatField;
    TblPreVendaCabAcrescimo: TFloatField;
    TblPreVendaCabDesconto: TFloatField;
    TblPreVendaCabTotalGeral: TFloatField;
    TblPreVendaCabNroCreditCard: TStringField;
    TblPreVendaCabNumerarioPagto: TStringField;
    TblPreVendaCabMensagem: TStringField;
    TblPreVendaCabDataEntrega: TStringField;
    TblPreVendaCabTipoVenda: TStringField;
    TblPreVendaItemTroca: TStringField;
    TblPreVendaCabTroco: TFloatField;
    TblPreVendaCabPEDIDOORCAMENTO: TStringField;
    TblPedidoFinanceiroNumerario: TStringField;
    TblPreVendaCabNomeClienteVenda: TStringField;
    TblPreVendaCabDocumentoClienteVenda: TStringField;
    TblPreVendaCabEnderecoClienteVenda: TStringField;
    TblPreVendaCabCidadeClienteVenda: TStringField;
    TblPreVendaCabOBSImpressaoCupom: TStringField;
    TblPreVendaCabFoneClienteVenda: TStringField;
    TblPreVendaCabUsuarioVendaSTR: TStringField;
    TblPreVendaCabPlacaVeiculo: TStringField;
    TblPedidoFinanceiroTipopadrao: TStringField;
    TblPreVendaCabVlrEntrada: TFloatField;
    TblPreVendaCabTERMICOD: TIntegerField;
    TblPreVendaCabPRVDICOD: TIntegerField;
    TblPreVendaCabBairroClienteVenda: TStringField;
    TblPreVendaCabKM: TStringField;
    TblPreVendaItemComplemento: TStringField;
    TblPreVendaItemImpCozinha: TStringField;
    TblPreVendaItemImpVale: TStringField;
    TblPedidoFinanceiroParcela: TStringField;
    TblPedidoFinanceiroPortador: TStringField;
    TblPreVendaCabClienteDependente: TStringField;
    TblPreVendaCabDataEmissao: TDateTimeField;
    TblPreVendaCabDisplayNumero: TIntegerField;
    TblPreVendaCabEmpresaEmit: TStringField;
    TblPreVendaCabEmpresaEmit_Ender: TStringField;
    TblPreVendaCabEmpresaEmit_Bairro: TStringField;
    TblPreVendaCabEmpresaEmit_Cidade: TStringField;
    TblPreVendaCabEmpresaEmit_Fone: TStringField;
    rdp: TRDprint;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation


{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
var CodCliente, CodVendaMontado, TerminalNome, DataPedido : String;
var Linha, vCol : integer;
var TotDesc, TotConfissao : Double;
var Inifile: TInifile;
    EmpresaNome, EmpresaEndereco, EmpresaFone, NroViasImpVenda, Saltar, Obs_Venda, MostraDisplay: String;
begin
  try
    IniFile := TIniFile.Create ('C:\Easy2Solutions\Gestao\Parceiro.INI');
    NroViasImpVenda := IniFile.ReadString('IB_Software','NroViasImpVenda','1');
    Saltar          := IniFile.ReadString('IB_Software','Saltar','5');
    Obs_Venda       := IniFile.ReadString('IB_Software','Obs_Venda','');
    MostraDisplay   := IniFile.ReadString('IB_Software','GravarDisplaySequencial','N');
    IniFile.Free;

    TblPreVendaCab.Open;
    TblPreVendaItem.Open;

    CodVendaMontado   := IntToStr(StrToInt(Copy(TblPreVendaCabTicketNumero.asString,1,3))) +'.'+
                         IntToStr(StrToInt(Copy(TblPreVendaCabTicketNumero.asString,4,3))) +'.'+
                         IntToStr(StrToInt(Copy(TblPreVendaCabTicketNumero.asString,7,7)));

    CodCliente   := Copy(TblPreVendaCabCliente.asString,1,13);

    EmpresaNome     := TblPreVendaCabEmpresaEmit.Value;
    EmpresaEndereco := TblPreVendaCabEmpresaEmit_Ender.value;
    EmpresaFone     := TblPreVendaCabEmpresaEmit_Fone.Value;

    // TerminalNome := dm.SQLLocate('TERMINAL','TERMICOD','TERMA60DESCR',TblPreVendaCabTERMICOD.AsString);
    // DataPedido   := TblPreVendaCabDataEmissao.AsString;

    Linha := 1;
    rdp.NumerodeCopias := 1;
    rdp.Abrir;
    rdp.Imp(Linha, 1,'.'); Inc(Linha);
    rdp.Imp(Linha, 1,EmpresaNome); Inc(Linha,2);
    rdp.Imp(Linha, 1,EmpresaEndereco); Inc(Linha);
    rdp.Imp(Linha, 1,EmpresaFone); Inc(Linha,2);

    if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PRE-VENDA' then
      rdp.Imp(Linha,1,'ORCAMENTO')
    else
      rdp.Imp(Linha,1,'PEDIDO');

    Inc(Linha,2);

    if (MostraDisplay = 'S') and (TblPreVendaCabDisplayNumero.Value>0) then
      rdp.Imp(Linha, 1,'Controle....: '  + TblPreVendaCabDisplayNumero.AsString)
    else
      rdp.Imp(Linha, 1,'Controle....: '  + CodVendaMontado);

    Inc(Linha,2);

    rdp.Imp(Linha, 1,'Data Ped....: '  + TblPreVendaCabDataEmissao.AsString); Inc(Linha);
    rdp.Imp(Linha, 1,'Impresso em.: '  + FormatDateTime('dd/mm/yy hh:nn:ss', now)); Inc(Linha,2);
    rdp.Imp(Linha,1,'Codigo    Descricao                      ');    Inc(Linha);
    rdp.Imp(Linha,1,'   Vlr.Unit     Quant   V.Desc  Vlr.Total');    Inc(Linha);
    rdp.Imp(Linha,1,'-----------------------------------------');    Inc(Linha);

    TotDesc := 0;
    TblPreVendaItem.First;
    While not TblPreVendaItem.eof Do
      Begin
        if TblPreVendaItemTroca.value <> 'S' then
          begin
            rdp.Imp(Linha, 1,FormatFloat('######000000',TblPreVendaItemCodigo.Value));
            rdp.Imp(Linha,10,copy(TblPreVendaItemDescricao.AsString,1,30));  Inc(Linha);
            rdp.ImpVal(Linha,6,'##0.00',TblPreVendaItemValorUnitario.Value,[]);
            rdp.ImpVal(Linha,15,'##0.000',TblPreVendaItemQuantidade.Value,[]);
            rdp.ImpVal(Linha,25,'##0.00',TblPreVendaItemDesconto.Value,[]);
            rdp.ImpVal(Linha,36,'##0.00',TblPreVendaItemValorTotal.Value,[]); Inc(Linha);
          end;
        TotDesc := TotDesc + TblPreVendaItemDesconto.Value;
        TblPreVendaItem.Next;
      End;

    // Testa se tem  Troca
    TblPreVendaItem.First;
    While not TblPreVendaItem.eof Do
      Begin
        if TblPreVendaItemTroca.value = 'S' then
          begin
            rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
            rdp.Imp(Linha,1,'          D E V O L U C A O              '); Inc(Linha);
            rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
            TblPreVendaItem.Last;
          end;
        TblPreVendaItem.Next;
      End;
    // Imprime Itens se tem  Troca
    TblPreVendaItem.First;
    While not TblPreVendaItem.eof Do
      Begin
        if TblPreVendaItemTroca.value = 'S' then
          begin
            rdp.Imp(Linha, 1,FormatFloat('######000000',TblPreVendaItemCodigo.Value));
            rdp.Imp(Linha,10,copy(TblPreVendaItemDescricao.AsString,1,30));  Inc(Linha);
            rdp.ImpVal(Linha,6,'##0.00',TblPreVendaItemValorUnitario.Value,[]);
            rdp.ImpVal(Linha,15,'##0.000',TblPreVendaItemQuantidade.Value,[]);
            rdp.ImpVal(Linha,25,'##0.00',TblPreVendaItemDesconto.Value,[]);
            rdp.ImpVal(Linha,36,'##0.00',TblPreVendaItemValorTotal.Value,[]); Inc(Linha);
          end;
        TblPreVendaItem.Next;
      End;

    // Final Venda
    rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
    rdp.Imp(Linha,17,'Total Itens R$');
    rdp.ImpVal(Linha,36,'##0.00',TblPreVendaCabTotalNominal.Value,[]); Inc(Linha);
    rdp.Imp(Linha,17,'Desconto    R$');
    rdp.ImpVal(Linha,36,'##0.00',TblPreVendaCabDesconto.Value+TotDesc,[]);
    Inc(Linha);
    rdp.Imp(Linha,1,'                -------------------------'); Inc(Linha);
    rdp.Imp(Linha,17,'Total Geral R$');
    rdp.ImpVal(Linha,36,'##0.00',(TblPreVendaCabTotalGeral.Value),[]);  Inc(Linha);
    // Numerarios da venda
    if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PEDIDO' then
      begin
        TotConfissao := 0;
        TblPedidoFinanceiro.Open;
        while not TblPedidoFinanceiro.eof do
          begin
            if TblPedidoFinanceiroTipopadrao.Value = 'CRD' then
              rdp.Imp(Linha,5,FormatDateTime('dd/mm/yy',TblPedidoFinanceiroVencimento.Value));

            rdp.Imp(Linha,17,TblPedidoFinanceiroNumerario.Value);
            if (TblPedidoFinanceiro.RecordCount = 1) and (TblPreVendaCabTroco.Value > 0) and (TblPedidoFinanceiroTipopadrao.Value= 'DIN') then
              rdp.ImpVal(Linha,36,'##0.00',(TblPedidoFinanceiroValor.Value+TblPreVendaCabTroco.Value),[])
            else
              rdp.ImpVal(Linha,36,'##0.00',(TblPedidoFinanceiroValor.Value),[]);
            Inc(Linha);
            if TblPedidoFinanceiroTipopadrao.Value = 'CRD' then
              TotConfissao := TotConfissao + TblPedidoFinanceiroValor.Value;
            TblPedidoFinanceiro.Next;
          end;
        TblPedidoFinanceiro.Close;
      end;
    if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PEDIDO' then
      begin
        rdp.Imp(Linha,1,'                -------------------------'); Inc(Linha);
        rdp.Imp(Linha,17,'Troco R$');
        rdp.ImpVal(Linha,36,'##0.00',(TblPreVendaCabTroco.Value),[]);  Inc(Linha);
      end;

    rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
    rdp.Imp(Linha, 1,'Cliente.: '+ copy(TblPreVendaCabNomeClienteVenda.AsString,1,35)); Inc(Linha);
    if TblPreVendaCabClienteDependente.AsString <> '' then
      begin rdp.Imp(Linha, 1,'Autoriz.: '+ TblPreVendaCabClienteDependente.AsString); Inc(Linha); end;
    if TblPreVendaCabFoneClienteVenda.AsString <> '' then
      begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabFoneClienteVenda.AsString,1,35)); Inc(Linha); end;
    if TblPreVendaCabEnderecoClienteVenda.AsString <> '' then
      begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabEnderecoClienteVenda.AsString,1,35)); Inc(Linha); end;
    if TblPreVendaCabBairroClienteVenda.AsString <> '' then
      begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabBairroClienteVenda.AsString,1,35)); Inc(Linha); end;
    if TblPreVendaCabCidadeClienteVenda.AsString <> '' then
      begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabCidadeClienteVenda.AsString,1,35)); Inc(Linha); end;
    if TblPreVendaCabPlacaVeiculo.AsString <> '' then
      begin rdp.Imp(Linha, 1,'Placa:    '+ TblPreVendaCabPlacaVeiculo.AsString); Inc(Linha); end;
    rdp.Imp(Linha, 1,'Plano...: '+ copy(TblPreVendaCabPlano.AsString,1,30)); Inc(Linha);
    rdp.Imp(Linha, 1,'Vendedor: '+ copy(TblPreVendaCabVendedor.AsString,1,30)); Inc(Linha);
    rdp.Imp(Linha, 1,'Operador: '+ copy(TblPreVendaCabUsuarioVendaSTR.AsString,1,30)); Inc(Linha);
    rdp.Imp(Linha, 1,'Terminal: '+ FormatFloat('###000',TblPreVendaCabTERMICOD.Value)); Inc(Linha);
    rdp.Imp(Linha, 1,'Observ..: '+ copy(TblPreVendaCabOBSImpressaoCupom.AsString,1,30)); Inc(Linha);
    rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
    rdp.Imp(Linha,1,Obs_Venda); Inc(Linha);
    rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha,2);

    if TblPreVendaCabTipoVenda.Value = 'CRD' then
      begin
        Inc(Linha,2);
        rdp.Imp(Linha, 1,EmpresaNome); Inc(Linha,2);
        rdp.Imp(Linha, 1,EmpresaEndereco); Inc(Linha);
        rdp.Imp(Linha, 1,EmpresaFone); Inc(Linha,2);
        rdp.Imp(Linha, 1,'Controle....: '  + TblPreVendaCabTicketNumero.AsString); Inc(Linha);
        rdp.Imp(Linha, 1,'Impresso em.: '  + FormatDateTime('dd/mm/yy hh:nn:ss', now)); Inc(Linha);
        rdp.Imp(Linha, 1,'Operador: '+ copy(TblPreVendaCabUsuarioVendaSTR.AsString,1,30)); Inc(Linha);
        rdp.Imp(Linha, 1,'Terminal: '+ FormatFloat('###000',TblPreVendaCabTERMICOD.Value)); Inc(Linha);
        rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
        rdp.Imp(Linha,1,'        CONFISSAO DE DIVIDA              '); Inc(Linha);
        rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
        rdp.Imp(Linha,20,'Valor R$');
        rdp.ImpVal(Linha,36,'##0.00',(TotConfissao),[]);  Inc(Linha);
        rdp.Imp(Linha, 1,' DECLARO PARA OS DEVIDOS FINS, QUE RECEBI AS '); Inc(Linha);
        rdp.Imp(Linha, 1,' MERCADORIAS E  QUE PAGAREI  PELA  COMPRA  NO'); Inc(Linha);
        rdp.Imp(Linha, 1,' VENCIMENTO ACORDADO!                        '); Inc(Linha,2);
        rdp.Imp(Linha, 1,'ASS. ___________________________________'); Inc(Linha);
        rdp.Imp(Linha, 5,TblPreVendaCabNomeClienteVenda.AsString); Inc(Linha);
      end;
    Linha:=Linha+StrToInt(Saltar);
    rdp.Imp(Linha, 1,'.'); Inc(Linha);
    rdp.TamanhoQteLinhas := 1;
    rdp.fechar;

    if NroViasImpVenda = '2' then
      if Application.MessageBox(PChar('Imprimir Segunda Via?'), PChar(Application.Title), MB_SYSTEMMODAL + MB_YesNo + MB_IconQuestion + MB_DEFBUTTON2) = IdYes then
        begin
          Linha := 1;
          rdp.NumerodeCopias := 1;
          rdp.Abrir;
          rdp.Imp(Linha, 1,EmpresaNome); Inc(Linha,2);
          rdp.Imp(Linha, 1,EmpresaEndereco); Inc(Linha);
          rdp.Imp(Linha, 1,EmpresaFone); Inc(Linha,2);
          if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PRE-VENDA' then
            rdp.Imp(Linha,1,'ORCAMENTO')
          else
            rdp.Imp(Linha,1,'PEDIDO');

          Inc(Linha,2);

          if (MostraDisplay = 'S') and (TblPreVendaCabDisplayNumero.Value>0) then
            rdp.Imp(Linha, 1,'Controle....: '  + TblPreVendaCabDisplayNumero.AsString)
          else
            rdp.Imp(Linha, 1,'Controle....: '  + CodVendaMontado);

          Inc(Linha,2);

          rdp.Imp(Linha, 1,'Data Ped....: '  + TblPreVendaCabDataEmissao.AsString); Inc(Linha);
          rdp.Imp(Linha, 1,'Emitido em..: '  + FormatDateTime('dd/mm/yyyy hh:nn:ss', now)); Inc(Linha,2);
          rdp.Imp(Linha,1,'Codigo    Descricao                      ');    Inc(Linha);
          rdp.Imp(Linha,1,'   Vlr.Unit     Quant   V.Desc  Vlr.Total');    Inc(Linha);
          rdp.Imp(Linha,1,'-----------------------------------------');    Inc(Linha);
          TotDesc :=  0;
          TblPreVendaItem.First;
          While not TblPreVendaItem.eof Do
            Begin
              if TblPreVendaItemTroca.value <> 'S' then
                begin
                  rdp.Imp(Linha, 1,FormatFloat('######000000',TblPreVendaItemCodigo.Value));
                  rdp.Imp(Linha,10,copy(TblPreVendaItemDescricao.AsString,1,30));  Inc(Linha);
                  rdp.ImpVal(Linha,6,'##0.00', TblPreVendaItemValorUnitario.Value,[]);
                  rdp.ImpVal(Linha,15,'##0.000',TblPreVendaItemQuantidade.Value,[]);
                  rdp.ImpVal(Linha,25,'##0.00', TblPreVendaItemDesconto.Value,[]);
                  rdp.ImpVal(Linha,36,'##0.00', TblPreVendaItemValorTotal.Value,[]); Inc(Linha);
                  TotDesc := TotDesc + TblPreVendaItemDesconto.Value ;
                end;
              TblPreVendaItem.Next;
            End;

          // Testa se tem  Troca
          TblPreVendaItem.First;
          While not TblPreVendaItem.eof Do
            Begin
              if TblPreVendaItemTroca.value = 'S' then
                begin
                  rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
                  rdp.Imp(Linha,1,'      D E V O L U C A O                  '); Inc(Linha);
                  rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
                  TblPreVendaItem.Last;
                end;
              TblPreVendaItem.Next;
            End;
          // Imprime Itens se tem  Troca
          TblPreVendaItem.First;
          While not TblPreVendaItem.eof Do
            Begin
              if TblPreVendaItemTroca.value = 'S' then
                begin
                  rdp.Imp(Linha, 1,FormatFloat('######000000',TblPreVendaItemCodigo.Value));
                  rdp.Imp(Linha,10,copy(TblPreVendaItemDescricao.AsString,1,30));  Inc(Linha);
                  rdp.ImpVal(Linha,6,'##0.00', TblPreVendaItemValorUnitario.Value,[]);
                  rdp.ImpVal(Linha,15,'##0.000',TblPreVendaItemQuantidade.Value,[]);
                  rdp.ImpVal(Linha,25,'##0.00', TblPreVendaItemDesconto.Value,[]);
                  rdp.ImpVal(Linha,36,'##0.00', TblPreVendaItemValorTotal.Value,[]); Inc(Linha);
                end;
              TblPreVendaItem.Next;
            End;

          // Final Venda
          rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
          rdp.Imp(Linha,17,'Total Itens R$');
          rdp.ImpVal(Linha,36,'##0.00',TblPreVendaCabTotalNominal.Value,[]); Inc(Linha);
          rdp.Imp(Linha,17,'Desconto    R$');
          rdp.ImpVal(Linha,36,'##0.00',TblPreVendaCabDesconto.Value+TotDesc,[]);
          Inc(Linha);
          rdp.Imp(Linha,1,'                -------------------------'); Inc(Linha);
          rdp.Imp(Linha,17,'Total Geral R$');
          rdp.ImpVal(Linha,36,'##0.00',TblPreVendaCabTotalGeral.Value,[]);  Inc(Linha);
          // Numerarios da venda
          if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PEDIDO' then
            begin
              TotConfissao := 0;
              TblPedidoFinanceiro.Open;
              while not TblPedidoFinanceiro.eof do
                begin
                  if TblPedidoFinanceiroTipopadrao.Value = 'CRD' then
                    rdp.Imp(Linha,10,FormatDateTime('dd/mm/yyyy',TblPedidoFinanceiroVencimento.Value));

                  rdp.Imp(Linha,22,TblPedidoFinanceiroNumerario.Value);
                  if (TblPedidoFinanceiro.RecordCount = 1) and (TblPreVendaCabTroco.Value > 0) and (TblPedidoFinanceiroTipopadrao.Value= 'DIN') then
                    rdp.ImpVal(Linha,36,'##0.00',(TblPedidoFinanceiroValor.Value+TblPreVendaCabTroco.Value),[])
                  else
                    rdp.ImpVal(Linha,36,'##0.00',(TblPedidoFinanceiroValor.Value),[]);
                  Inc(Linha);
                  if TblPedidoFinanceiroTipopadrao.Value = 'CRD' then
                    TotConfissao := TotConfissao + TblPedidoFinanceiroValor.Value;
                  TblPedidoFinanceiro.Next;
                end;
              TblPedidoFinanceiro.Close;
            end;
          if TblPreVendaCabPEDIDOORCAMENTO.AsString = 'PEDIDO' then
            begin
              rdp.Imp(Linha,1,'                -------------------------'); Inc(Linha);
              rdp.Imp(Linha,22,'Troco R$');
              rdp.ImpVal(Linha,36,'##0.00',(TblPreVendaCabTroco.Value),[]);  Inc(Linha);
            end;

          rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
          rdp.Imp(Linha, 1,'Cliente.: '+ copy(TblPreVendaCabNomeClienteVenda.AsString,1,35)); Inc(Linha);
          if TblPreVendaCabClienteDependente.AsString <> '' then
            begin rdp.Imp(Linha, 1,'Autoriz.: '+ TblPreVendaCabClienteDependente.AsString); Inc(Linha); end;
          if TblPreVendaCabFoneClienteVenda.AsString <> '' then
            begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabFoneClienteVenda.AsString,1,35)); Inc(Linha); end;
          if TblPreVendaCabEnderecoClienteVenda.AsString <> '' then
            begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabEnderecoClienteVenda.AsString,1,35)); Inc(Linha); end;
          if TblPreVendaCabBairroClienteVenda.AsString <> '' then
            begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabBairroClienteVenda.AsString,1,35)); Inc(Linha); end;
          if TblPreVendaCabCidadeClienteVenda.AsString <> '' then
            begin rdp.Imp(Linha, 1,'          '+ copy(TblPreVendaCabCidadeClienteVenda.AsString,1,35)); Inc(Linha); end;
          if TblPreVendaCabPlacaVeiculo.AsString <> '' then
            begin rdp.Imp(Linha, 1,'Placa:    '+ TblPreVendaCabPlacaVeiculo.AsString); Inc(Linha); end;

          rdp.Imp(Linha, 1,'Plano...: '+ copy(TblPreVendaCabPlano.AsString,1,30)); Inc(Linha);
          rdp.Imp(Linha, 1,'Vendedor: '+ copy(TblPreVendaCabVendedor.AsString,1,30)); Inc(Linha);
          rdp.Imp(Linha, 1,'Operador: '+ copy(TblPreVendaCabUsuarioVendaSTR.AsString,1,30)); Inc(Linha);
          rdp.Imp(Linha, 1,'Terminal: '+ FormatFloat('###000',TblPreVendaCabTERMICOD.Value)); Inc(Linha);
          rdp.Imp(Linha, 1,'Observ..: '+ copy(TblPreVendaCabOBSImpressaoCupom.AsString,1,30)); Inc(Linha);
          rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
          rdp.Imp(Linha,1,Obs_Venda); Inc(Linha);
          rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha,2);

          if TblPreVendaCabTipoVenda.Value = 'CRD' then
            begin
              Inc(Linha,2);
              rdp.Imp(Linha, 1,EmpresaNome); Inc(Linha,2);
              rdp.Imp(Linha, 1,EmpresaEndereco); Inc(Linha);
              rdp.Imp(Linha, 1,EmpresaFone); Inc(Linha,2);
              rdp.Imp(Linha, 1,'Controle....: '  + TblPreVendaCabTicketNumero.AsString); Inc(Linha);
              rdp.Imp(Linha, 1,'Impresso em.: '  + FormatDateTime('dd/mm/yy hh:nn:ss', now)); Inc(Linha);
              rdp.Imp(Linha, 1,'Operador: '+ copy(TblPreVendaCabUsuarioVendaSTR.AsString,1,30)); Inc(Linha);
              rdp.Imp(Linha, 1,'Terminal: '+ FormatFloat('###000',TblPreVendaCabTERMICOD.Value)); Inc(Linha);
              rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
              rdp.Imp(Linha,1,'       CONFISSAO DE DIVIDA               '); Inc(Linha);
              rdp.Imp(Linha,1,'-----------------------------------------'); Inc(Linha);
              rdp.Imp(Linha,20,'Valor R$');
              rdp.ImpVal(Linha,36,'##0.00',(TotConfissao),[]);  Inc(Linha);
              rdp.Imp(Linha, 1,' DECLARO PARA OS DEVIDOS FINS, QUE RECEBI AS '); Inc(Linha);
              rdp.Imp(Linha, 1,' MERCADORIAS E  QUE PAGAREI  PELA  COMPRA  NO'); Inc(Linha);
              rdp.Imp(Linha, 1,' VENCIMENTO ACORDADO!                   '); Inc(Linha,2);
              rdp.Imp(Linha, 1,'ASS. ______________________________'); Inc(Linha);
              rdp.Imp(Linha, 1,TblPreVendaCabNomeClienteVenda.AsString); Inc(Linha);
            end;
          Linha:=Linha+StrToInt(Saltar);
          rdp.Imp(Linha, 1,'.'); Inc(Linha);
          rdp.TamanhoQteLinhas := 1;
          rdp.Fechar;
        end;

    if FileExists('Picote.exe') then
      WinExec(Pchar('Picote.exe'),SW_HIDE);

    Application.Terminate;
  except
    Application.Terminate;
  end;
end;

procedure TFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree ;
end;

end.