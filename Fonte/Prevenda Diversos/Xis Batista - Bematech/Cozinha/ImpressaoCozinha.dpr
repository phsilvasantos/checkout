program ImpressaoCozinha;

uses
  Forms,
  Principal in 'Principal.pas' {FormPrincipal},
  declaracoes in 'declaracoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cozinha';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.