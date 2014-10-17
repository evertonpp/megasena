program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Loteria};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoteria, Loteria);
  Application.Run;
end.
