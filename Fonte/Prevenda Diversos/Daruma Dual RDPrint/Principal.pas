unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCrpe32, DB, DBTables, RxQuery, VarSys, ExtCtrls, ComCtrls,
  RDprint;

type
  TFormPrincipal = class(TForm)
    TblPedido: TTable;
    TblPedidoItem: TTable;
    TblPedidoFinanceiro: TTable;
    TblPedidoPedICod: TStringField;
    TblPedidoEmitente_Nome: TStringField;
    TblPedidoEmitente_Ender: TStringField;
    TblPedidoEmitente_Bairro: TStringField;
    TblPedidoEmitente_Cidade: TStringField;
    TblPedidoEmitente_UF: TStringField;
    TblPedidoEmitente_CGC: TStringField;
    TblPedidoEmitente_IE: TStringField;
    TblPedidoEmitente_Fone: TStringField;
    TblPedidoDestinatario_Nome: TStringField;
    TblPedidoDestinatario_Endereco: TStringField;
    TblPedidoDestinatario_Bairro: TStringField;
    TblPedidoDestinatario_Cep: TStringField;
    TblPedidoDestinatario_Cidade: TStringField;
    TblPedidoDestinatario_UF: TStringField;
    TblPedidoDestinatario_CpfCgc: TStringField;
    TblPedidoDestinatario_IE: TStringField;
    TblPedidoDestinatario_Fone: TStringField;
    TblPedidoDestinatario_Fax: TStringField;
    TblPedidoTransp: TStringField;
    TblPedidoDtaEntrega: TDateField;
    TblPedidoComprador: TStringField;
    TblPedidoOrdemCompra: TStringField;
    TblPedidoPlano: TStringField;
    TblPedidoTipoFrete: TStringField;
    TblPedidoValorFrete: TFloatField;
    TblPedidoTotalDesconto: TFloatField;
    TblPedidoTotal: TFloatField;
    TblPedidoObservacoes: TMemoField;
    TblPedidoVendedor: TStringField;
    TblPedidoEmail: TStringField;
    TblPedidoItemPedICod: TStringField;
    TblPedidoItemCodigo: TIntegerField;
    TblPedidoItemDescricao: TStringField;
    TblPedidoItemVlrUnitario: TFloatField;
    TblPedidoItemVlrTotal: TFloatField;
    TblPedidoFinanceiroPedICod: TStringField;
    TblPedidoFinanceiroVencimento: TDateField;
    TblPedidoFinanceiroValor: TFloatField;
    TblPedidoItemUn: TStringField;
    TblPedidoItemQtd1: TFloatField;
    TblPedidoItemCor: TStringField;
    TblPedidoItemTecido: TStringField;
    TblPedidoItemLegenda: TIntegerField;
    TblPedidoItemQtd2: TFloatField;
    TblPedidoItemQtd3: TFloatField;
    TblPedidoItemQtd4: TFloatField;
    TblPedidoItemQtd5: TFloatField;
    TblPedidoItemQtd6: TFloatField;
    TblPedidoItemQtd7: TFloatField;
    TblPedidoItemQtd8: TFloatField;
    TblPedidoItemQtd9: TFloatField;
    TblPedidoItemQtd10: TFloatField;
    TblPedidoItemQtd11: TFloatField;
    TblPedidoItemQtd12: TFloatField;
    TblPedidoItemQtd13: TFloatField;
    TblPedidoItemQtd14: TFloatField;
    TblPedidoItemQtd15: TFloatField;
    TblPedidoPEDIDOORCAMENTO: TStringField;
    TblPedidoEmitente_Email: TStringField;
    TblPedidoEmitente_Fax: TStringField;
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
    TblPreVendaCabNomeEmpresa: TStringField;
    TblPreVendaCabFoneEmpresa: TStringField;
    TblPreVendaCabNroCreditCard: TStringField;
    TblPreVendaCabNumerarioPagto: TStringField;
    TblPreVendaCabMensagem: TStringField;
    TblPreVendaCabDataEntrega: TStringField;
    TblPreVendaCabTipoVenda: TStringField;
    TblPreVendaCabPessoaRecebeNome: TStringField;
    TblPreVendaCabPessoaRecebeEnder: TStringField;
    TblPreVendaCabPessoaRecebeBai: TStringField;
    TblPreVendaCabPessoaRecebeCid: TStringField;
    TblPreVendaCabPessoaRecebeUF: TStringField;
    TblPreVendaCabPessoaRecebeFone: TStringField;
    TblPreVendaCabMensagem2: TMemoField;
    TblPreVendaCabVlrEntrada: TFloatField;
    TblPreVendaCabNomeClienteVenda: TStringField;
    TblPreVendaCabDocumentoClienteVenda: TStringField;
    TblPreVendaCabEnderecoClienteVenda: TStringField;
    TblPreVendaCabCidadeClienteVenda: TStringField;
    TblPreVendaCabOBSImpressaoCupom: TStringField;
    TblPreVendaItemTroca: TStringField;
    TblPedidoItemTroca: TStringField;
    TblPedidoDtEmissao: TDateTimeField;
    TblPedidoItemMarca: TStringField;
    SQLPrevendaContasReceber: TRxQuery;
    SQLPrevendaContasReceberPVCRICOD: TIntegerField;
    SQLPrevendaContasReceberTERMICOD: TIntegerField;
    SQLPrevendaContasReceberPRVDICOD: TIntegerField;
    SQLPrevendaContasReceberCLIEA13ID: TStringField;
    SQLPrevendaContasReceberNUMEICOD: TIntegerField;
    SQLPrevendaContasReceberPVCRN2VLR: TBCDField;
    SQLPrevendaNumerario: TRxQuery;
    SQLPrevendaNumerarioTERMICOD: TIntegerField;
    SQLPrevendaNumerarioPRVDICOD: TIntegerField;
    SQLPrevendaNumerarioNUMEICOD: TIntegerField;
    SQLPrevendaNumerarioPVNUN2VLR: TBCDField;
    TblPreVendaCabTERMICOD: TIntegerField;
    TblPreVendaCabPRVDICOD: TIntegerField;
    SQLPrevendaContasReceberPVCRINROPARC: TIntegerField;
    SQLPrevendaContasReceberPVCRDVENC: TDateTimeField;
    TblPreVendaCabDataEmissao: TDateTimeField;
    TblPedidoFinanceiroParcela: TStringField;
    TblPedidoFinanceiroNumerario: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VlrBonusTroca : Double;
  end;

    Function Daruma_DUAL_ImprimirTexto( TextoLivre: String; TamanhoTexto: Integer ): Integer; StdCall; External 'Daruma32.dll'
    Function Daruma_DUAL_AcionaGaveta() : Integer; StdCall; External 'Daruma32.dll'
    Function Daruma_Registry_DUAL_Porta(Porta : String)  : Integer; StdCall; External 'Daruma32.dll'

var
  FormPrincipal: TFormPrincipal;

implementation

uses DataModulo, DataModuloTemplate;

{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
var CodCliente : String;
var Parc : Integer;
begin
  VlrBonusTroca := 0 ;
  try
    TblPreVendaCab.Open;
    TblPreVendaItem.Open;
    If TblPedido.Exists Then
      TblPedido.DeleteTable;
    TblPedido.CreateTable;
    TblPedido.AddIndex('Primario','PedICod',[ixPrimary]);
    TblPedido.Open;
    TblPedido.Append;
    TblPedidoPEDIDOORCAMENTO.AsString        := 'PR� VENDA NRO: ';
    TblPedidoPedICod.AsString                := TblPreVendaCabTicketNumero.asString;
    CodCliente := Copy(TblPreVendaCabCliente.asString,1,13);

    if (TblPreVendaCabNomeClienteVenda.Value = dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60RAZAOSOC','"'+CodCliente+'"')) or (TblPreVendaCabNomeClienteVenda.Value = '') then
      TblPedidoDestinatario_Nome.asString  := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60RAZAOSOC','"'+CodCliente+'"')
    else
      TblPedidoDestinatario_Nome.asString  := TblPreVendaCabNomeClienteVenda.Value;

    if (TblPreVendaCabEnderecoClienteVenda.Value = dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60ENDRES','"'+CodCliente+'"')) or (TblPreVendaCabEnderecoClienteVenda.Value = '') then
      TblPedidoDestinatario_Endereco.asString  := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60ENDRES','"'+CodCliente+'"')
    else
      TblPedidoDestinatario_Endereco.asString  := TblPreVendaCabEnderecoClienteVenda.Value;

    if (TblPreVendaCabCidadeClienteVenda.Value = dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60CIDRES','"'+CodCliente+'"')) or (TblPreVendaCabCidadeClienteVenda.Value = '') then
      TblPedidoDestinatario_Cidade.asString  := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60CIDRES','"'+CodCliente+'"')
    else
      TblPedidoDestinatario_Cidade.asString  := TblPreVendaCabCidadeClienteVenda.Value;

    if (TblPreVendaCabNomeClienteVenda.Value = dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60RAZAOSOC','"'+CodCliente+'"')) or (TblPreVendaCabNomeClienteVenda.Value = '') then
      begin
        TblPedidoDestinatario_Nome.asString      := CodCliente+'-'+TblPedidoDestinatario_Nome.asString;
        TblPedidoDestinatario_Bairro.asString    := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA60BAIRES','"'+CodCliente+'"');
        TblPedidoDestinatario_Cep.asString       := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA8CEPRES','"'+CodCliente+'"');
        TblPedidoDestinatario_UF.asString        := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA2UFRES','"'+CodCliente+'"');
        // Testa se � Fisica ou Juridica
        if dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA5FISJURID','"'+CodCliente+'"') = 'F' then
          begin
            TblPedidoDestinatario_CpfCgc.asString    := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA11CPF','"'+CodCliente+'"');
            TblPedidoDestinatario_IE.asString        := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA10RG','"'+CodCliente+'"');
          end
        else
          begin
            TblPedidoDestinatario_CpfCgc.asString    := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA14CGC','"'+CodCliente+'"');
            TblPedidoDestinatario_IE.asString        := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA20IE','"'+CodCliente+'"');
          end;
        TblPedidoDestinatario_Fone.asString      := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA15FONE1','"'+CodCliente+'"');
        TblPedidoDestinatario_Fax.asString       := dm.SQLLocate('CLIENTE','CLIEA13ID','CLIEA15FAX','"'+CodCliente+'"');
      end;
    TblPedidoDtaEntrega.AsString             := TblPreVendaCabDataEntrega.AsString;
    TblPedidoComprador.asString              := '';
    TblPedidoOrdemCompra.asString            := '';
    TblPedidoVendedor.asString               := TblPreVendaCabVendedor.AsString;
    TblPedidoPlano.asString                  := TblPreVendaCabPlano.AsString;
    // Tipo de Frete (N�o existe na venda a balcao)
    TblPedidoTransp.asString                 := '';
    TblPedidoTipoFrete.asString              := '';
    TblPedidoValorFrete.AsString             := '';

    TblPedidoTotalDesconto.Value             := TblPreVendaCabDesconto.Value;
    TblPedidoTotal.Value                     := TblPreVendaCabTotalGeral.Value;
    TblPedidoObservacoes.asString            := TblPreVendaCabOBSImpressaoCupom.Value;
    TblPedidoEmail.asString                  := '';
    TblPedido.Post;

    If TblPedidoItem.Exists Then
      TblPedidoItem.DeleteTable;
    TblPedidoItem.CreateTable;
    TblPedidoItem.Open;
    TblPreVendaItem.First;
    While Not TblPreVendaItem.Eof Do
      Begin
        TblPedidoItem.Append;
        TblPedidoItemPedICod.Value     := TblPreVendaCabTicketNumero.asString;
        TblPedidoItemCodigo.Value      := TblPreVendaItemCodigo.Value;
        TblPedidoItemDescricao.Value   := dm.SQLLocate('PRODUTO','PRODICOD','PRODA30ADESCRREDUZ',TblPreVendaItemCodigo.AsString);
        TblPedidoItemTecido.Value      := Copy(dm.SQLLocate('PRODUTO','PRODICOD','PRODA60REFER',TblPreVendaItemCodigo.AsString),1,12);
        TblPedidoItemUn.Value          := dm.SQLLocate('UNIDADE','UNIDICOD','UNIDA5DESCR',dm.SQLLocate('PRODUTO','PRODICOD','UNIDICOD',TblPreVendaItemCodigo.AsString));
        TblPedidoItemVlrUnitario.Value := TblPreVendaItemValorUnitario.Value;
        TblPedidoItemQtd1.Value        := TblPreVendaItemQuantidade.Value;
        TblPedidoItemTroca.Value       := TblPreVendaItemTroca.Value;
        TblPedidoItemVlrTotal.Value    := TblPreVendaItemValorTotal.Value;
        TblPedidoItemMarca.Value       := dm.SQLLocate('MARCA','MARCICOD','MARCA60DESCR',dm.SQLLocate('PRODUTO','PRODICOD','MARCICOD',TblPreVendaItemCodigo.AsString));
        TblPedidoItemCor.Value         := dm.SQLLocate('COR','CORICOD','CORA30DESCR',dm.SQLLocate('PRODUTO','PRODICOD','CORICOD',TblPreVendaItemCodigo.AsString));
        TblPedidoItem.Post;
        if TblPedidoItemTroca.Value = 'S' then
          VlrBonusTroca := VlrBonusTroca + (TblPedidoItemVlrUnitario.Value*TblPedidoItemQtd1.Value);
        TblPreVendaItem.Next;
      End;

    TblPedidoFinanceiro.Open;
    While not TblPedidoFinanceiro.eof Do
     TblPedidoFinanceiro.Delete;
    SQLPrevendaNumerario.Close;
    SQLPrevendaNumerario.MacroByName('MFiltro').Value := 'TERMICOD = ' + TblPreVendaCabTERMICOD.AsString + 'and PRVDICOD = ' + TblPreVendaCabPRVDICOD.AsString;
    SQLPrevendaNumerario.Open;
    SQLPrevendaContasReceber.Close;
    SQLPrevendaContasReceber.MacroByName('MFiltro').Value := 'TERMICOD = ' + TblPreVendaCabTERMICOD.AsString + 'and PRVDICOD = ' + TblPreVendaCabPRVDICOD.AsString;
    SQLPrevendaContasReceber.Open;

    if not SQLPrevendaNumerario.IsEmpty then
      begin
        SQLPrevendaNumerario.first;
        while Not SQLPrevendaNumerario.Eof Do
          begin
            TblPedidoFinanceiro.Append;
            TblPedidoFinanceiroPedICod.AsString     := TblPreVendaCabTicketNumero.asString;
            TblPedidoFinanceiroParcela.AsString     := 'Ent';
            TblPedidoFinanceiroValor.Value          := SQLPrevendaNumerarioPVNUN2VLR.Value;
            TblPedidoFinanceiroVencimento.AsString  := FormatDateTime('dd/mm/yyyy',TblPreVendaCabDataEmissao.AsDateTime);
            TblPedidoFinanceiroNumerario.AsString   := DM.SQLLocate('NUMERARIO','NUMEICOD','NUMEA30DESCR',SQLPrevendaNumerarioNUMEICOD.AsString);
            TblPedidoFinanceiro.Post;
            SQLPrevendaNumerario.Next;
          end;
      end;
    if not SQLPrevendaContasReceber.IsEmpty then
      begin
        Parc := 1;
        SQLPrevendaContasReceber.first;
        while Not SQLPrevendaContasReceber.Eof Do
          begin
            TblPedidoFinanceiro.Append;
            TblPedidoFinanceiroPedICod.AsString   := TblPreVendaCabTicketNumero.asString;
            TblPedidoFinanceiroParcela.AsString   := FormatFloat('###000',SQLPrevendaContasReceberPVCRINROPARC.Value);
            TblPedidoFinanceiroValor.Value        := SQLPrevendaContasReceberPVCRN2VLR.Value;
            TblPedidoFinanceiroVencimento.Value   := SQLPrevendaContasReceberPVCRDVENC.Value;
            TblPedidoFinanceiroNumerario.AsString := DM.SQLLocate('NUMERARIO','NUMEICOD','NUMEA30DESCR',SQLPrevendaContasReceberNUMEICOD.AsString);
            TblPedidoFinanceiro.Post;
            SQLPrevendaContasReceber.Next;
            Parc := Parc+1;
          end;
      end;
  except
    Application.Terminate;
  end;
end;

procedure TFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TblPedido.Close;
  TblPedidoItem.Close;
  TblPedidoFinanceiro.Close;
  Action := cafree ;
end;

procedure TFormPrincipal.FormActivate(Sender: TObject);
begin
  // Cabecalho da Venda
  //  Daruma_DUAL_AcionaGaveta;
  Daruma_DUAL_ImprimirTexto(Pchar('<e>MERCADO SILVA</e><l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>RUA CRICIUMA, 537 LJ.02</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Fone/Fax.: (51)3490.3051/3042.6447</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Controle.: '+TblPedidoPedICod.AsString+'</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Data.....: '+FormatDateTime('dd/mm/yyyy hh:mm',NOW)+'</n><l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Cliente..: '+TblPedidoDestinatario_Nome.AsString+'</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>CPF/CNPJ.: '+TblPedidoDestinatario_CpfCgc.AsString+'</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Endereco.: '+TblPedidoDestinatario_Endereco.AsString+'</n>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Cidade...: '+TblPedidoDestinatario_Cidade.AsString+'</n><l>'),0);
  // Itens da Venda
  Daruma_DUAL_ImprimirTexto(Pchar('<n>Codigo Descricao                                    Quant        Vlr.Unit        Vlr.Total</n>'),0);
  TblPedidoItem.First;
  While not TblPedidoItem.eof Do
    Begin
      Daruma_DUAL_ImprimirTexto(Pchar('<n>'+FormatFloat('######000000',TblPedidoItemCodigo.value)+' '+copy(TblPedidoItemDescricao.AsString,1,30)+'</n>'),0);
      Daruma_DUAL_ImprimirTexto(Pchar('<n>  '+FormatFloat('##0.000',TblPedidoItemQtd1.Value)+'           '+FormatFloat('##0.00',TblPedidoItemVlrUnitario.Value)+'          '+FormatFloat('##0.00',TblPedidoItemVlrTotal.Value)+'</n>'),0);
      TblPedidoItem.Next;
    End;
  Daruma_DUAL_ImprimirTexto(Pchar('<l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>          Total Itens     R$   '+FormatFloat('##0.00',(TblPedidoTotal.Value + VlrBonusTroca +TblPedidoTotalDesconto.Value))),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>          Desconto        R$   '+FormatFloat('##0.00',TblPedidoTotalDesconto.Value)),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<n>          Total Geral     R$   '+FormatFloat('##0.00',TblPedidoTotal.Value)+'<l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('Ass.Cliente: _____________________ </n><l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<l></l><l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<l></l><l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<l></l><l></l>'),0);
  Daruma_DUAL_ImprimirTexto(Pchar('<l></l><l></l>'),0);
  Application.Terminate;
end;

end.
