unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtActns, zlibex, ComCtrls;

type
  TLoteria = class(TForm)
    btBaixar: TButton;
    btDescompactar: TButton;
    brGerar: TButton;
    mmLog: TRichEdit;
    procedure btBaixarClick(Sender: TObject);
    procedure btDescompactarClick(Sender: TObject);
    procedure brGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure log(pLinha: string; pCor: string = '');
  public
    { Public declarations }
  end;

var
  Loteria: TLoteria;
  ln: Integer;

implementation

{$R *.dfm}

//==================================================================================================
procedure TLoteria.log(pLinha: string; pCor: string = '');
begin
  ln := ln + 1;
  if pCor = '' then
    mmLog.SelAttributes.Color := clGray
  else
    mmLog.SelAttributes.Color := TColor(pCor);
  mmLog.Lines.Add(IntToStr(ln) + ' ' + pLinha);
end;

//==================================================================================================
procedure TLoteria.btBaixarClick(Sender: TObject);
begin
  with TDownloadURL.Create(self) do
    try
      log('Tentando fazer download de D_mgsasc.zip');
      //FileName  := 'C:\Users\evertonpp\Documents\Loteria\Delphi\D_mgsasc.zip';
      FileName  := 'C:\Users\evertonpp\Documents\GitHub\D_mgsasc.zip';
      URL := 'http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_mgsasc.zip';
      ExecuteTarget(nil) ;
    finally
      Free;
      log('Download concluído');
    end;                                 
end;

//==================================================================================================
procedure TLoteria.btDescompactarClick(Sender: TObject);
begin
  //http://www.edudelphipage.com.br/dicas_titulos.php?categoria=2
  //winexec(PChar('C:\Program Files\WinRAR\WinRAR.exe e *.zip *htm'),sw_normal);
end;        

//==================================================================================================
procedure TLoteria.FormShow(Sender: TObject);
begin
  ln := 0;
end;

//==================================================================================================
procedure TLoteria.brGerarClick(Sender: TObject);
var
  arqIn, arqOut: TextFile;
  linha: String;
  cont: integer;
begin
  cont := 0;
  //AssignFile(arq, 'E:\Softwares\loteria\megasena\d_megasc.htm');
  AssignFile(arqIn, 'C:\Users\evertonpp\Documents\GitHub\megasena\d_megasc.htm');
  Reset(arqIn);
  Readln(arqIn, linha);
  while (not eof(arqIn)) do
  begin
    cont := cont + 1;
    Readln(arqIn, linha);
    if trim(linha) <> '' then
      log(IntToStr(cont) + ' ' + linha);

  end;

  CloseFile(arqIn);
  mmLog.Lines.SaveToFile('C:\Users\evertonpp\Documents\GitHub\megasena\log.txt');
end;



end.
