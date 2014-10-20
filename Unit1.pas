unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtActns, ComCtrls;

type
  TLoteria = class(TForm)
    btBaixar: TButton;
    btDescompactar: TButton;
    btGerar: TButton;
    mmLog: TRichEdit;
    cbLocal: TCheckBox;
    mmx: TRichEdit;
    procedure btBaixarClick(Sender: TObject);
    procedure btDescompactarClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbLocalClick(Sender: TObject);
  private
    procedure Log(pLinha: string; pCor: string = '');
    procedure GerarTop;
  public
    { Public declarations }
  end;

var
  Loteria: TLoteria;
  strLocal: string;

implementation

{$R *.dfm}

//==================================================================================================
procedure TLoteria.Log(pLinha: string; pCor: string = '');
begin
  if pCor = '' then
    mmLog.SelAttributes.Color := clGray
  else
    mmLog.SelAttributes.Color := TColor(pCor);
  mmLog.Lines.Add(IntToStr(mmLog.Lines.Count) + ' ' + pLinha);
end;

//==================================================================================================
procedure TLoteria.btBaixarClick(Sender: TObject);
begin
  with TDownloadURL.Create(self) do
    try
      log('Tentando fazer download de D_mgsasc.zip');
      //FileName  := 'E:\Softwares\loteria\megasena\D_mgsasc.zip';
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
  strLocal := 'E:\Softwares\loteria\megasena\';
end;

//==================================================================================================
procedure TLoteria.cbLocalClick(Sender: TObject);
begin
  if cbLocal.Checked then
    strLocal := 'E:\Softwares\loteria\megasena\'
  else
    strLocal := 'C:\Users\evertonpp\Documents\GitHub\megasena\';
end;

//==================================================================================================
procedure TLoteria.GerarTop;
var
  arqIn, arqOut: TextFile;
  linha: String;
begin
  AssignFile(arqIn, strLocal + 'topres.htm');
  AssignFile(arqOut, strLocal + 'res.htm');
  Reset(arqIn);
  Rewrite(arqOut);
  while (not eof(arqIn)) do
  begin
    Readln(arqIn, linha);
    Writeln(arqOut, linha);
    Log(linha);
  end;
  CloseFile(arqIn);
  CloseFile(arqOut);
  Log('restop.htm adicionado', 'clGreen');
end;

//==================================================================================================
procedure TLoteria.btGerarClick(Sender: TObject);
var
  arqIn, arqOut: TextFile;
  linha: String;
  cont, tupla: integer;
  arqLst: TStringList;
begin
  //http://www.edudelphipage.com.br/dicas_titulos.php?categoria=2
  cont := 0;
  tupla := 0;
  GerarTop;
  AssignFile(arqIn, strLocal + 'd_megasc.htm');
  AssignFile(arqOut, strLocal + 'res.htm');
  arqLst := TStringList.Create;
  arqLst.LoadFromFile(strLocal + 'lst.htm');

  Reset(arqIn);
  Append(arqOut);
  Readln(arqIn, linha); // pula
  while (not eof(arqIn)) do
  begin
    cont := cont + 1;
    Readln(arqIn, linha);
    if trim(linha) <> '' then
    begin
      //mmx.Lines.Add(linha);
      arqLst.Add(trim(linha));
      if (linha = '</tr>') then
      begin
        tupla := tupla + 1;
        Log('fim da tupla ' + IntToStr(tupla), 'clBlue');
        //mmx.Lines.Move(mmx.Lines.Count, 0);
        arqLst.Move(arqlst.Count - 1, 0);
      end;


      Writeln(arqOut, trim(linha));
      Log(linha);
    end;
    if cont = 100 then break;
  end;
  Log('res.htm povoado', 'clGreen');
  CloseFile(arqIn);
  CloseFile(arqOut);
  arqLst.SaveToFile(strLocal + 'lst.htm');
  mmx.Lines.LoadFromFile(strLocal + 'lst.htm');
  //mmLog.Lines.SaveToFile(strLocal + 'log.txt');
  //Log('log.txt gerado', 'clBlue');  
end;


end.
