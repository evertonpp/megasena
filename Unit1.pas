unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  arq: TextFile;
  linha: String;
begin
  //http://www.edudelphipage.com.br/dicas_titulos.php?categoria=2
  //winexec(PChar('C:\Program Files\WinRAR\WinRAR.exe e *.zip *htm'),sw_normal);
  AssignFile(arq, 'E:\Softwares\loteria\megasena\d_megasc.htm');
  Reset(arq);
  Readln(arq, linha);
  Memo1.Lines.Add(linha);
  Memo1.Lines.Add('02 linha');
  Readln(arq, linha);
  Memo1.Lines.Add(linha);
  CloseFile(arq);
end;

end.
