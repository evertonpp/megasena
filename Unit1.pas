unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtActns, ComCtrls;

type
  TLoteria = class(TForm)
    btBaixar: TButton;
    btDescompactar: TButton;
    mmLog: TRichEdit;
    btnGerar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btBaixarClick(Sender: TObject);
    procedure btDescompactarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    function TemArquivo(pFile: string): boolean;
    procedure Log(pLinha: string; pCor: string = '');
    procedure GerarTmpMain;
  public
    { Public declarations }
  end;

var
  Loteria: TLoteria;
  strLocal: string;

implementation

{$R *.dfm}

//==================================================================================================
procedure TLoteria.FormShow(Sender: TObject);
begin
  strLocal := ExtractFilePath(Application.ExeName) + '\etc\';
  strLocal := GetCurrentDir + '\etc\';
end;

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
function TLoteria.TemArquivo(pFile: string): boolean;
var
  achou: Boolean;
begin
  achou := false;
  if FileExists('E:\Softwares\loteria\megasena\etc\d_megasc.htm') then
  begin
    strLocal := 'E:\Softwares\loteria\megasena\etc\';
    achou := true;
  end;
  if FileExists('C:\Users\evertonpp\Documents\GitHub\megasena\etc\d_megasc.htm') then
  begin
    strLocal := 'C:\Users\evertonpp\Documents\GitHub\megasena\etc\';
    achou := true;
  end;
  if not achou then
  begin
    log('Diretório raiz não encontrado em:');
    log('  E:\Softwares\loteria\megasena\etc\');
    log('  C:\Users\evertonpp\Documents\GitHub\megasena\etc\');
  end;
  Result := achou;
end;

//==================================================================================================
procedure TLoteria.btBaixarClick(Sender: TObject);
begin
  with TDownloadURL.Create(self) do
    try
      log('Iniciando download de http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_mgsasc.zip', 'clBlue');
      FileName  := strLocal + 'D_mgsasc.zip';
      URL := 'http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_mgsasc.zip';
      ExecuteTarget(nil) ;
    finally
      log('Download concluído', 'clGreen');
      Free;
    end;
end;

//==================================================================================================
procedure TLoteria.btDescompactarClick(Sender: TObject);
begin
  //http://www.edudelphipage.com.br/dicas_titulos.php?categoria=2
  if FileExists('C:\Program Files (x86)\WinRAR\WinRAR.exe') then
  begin
    log('Descompactando D_mgsasc.zip');
    winexec(PChar('C:\Program Files (x86)\WinRAR\WinRAR.exe e *.zip *htm'),sw_normal);
  end
  else
    log('Winrar não encontrado em C:\Program Files (x86)\WinRAR\WinRAR.exe', 'clRed');
end;        

//==================================================================================================
procedure TLoteria.GerarTmpMain;
var
  arqLst: TStringList;
  arqIn: TextFile;
  tupla: integer;
  linha: String;
begin
  log('Início GerarTmpMain');
  arqLst := TStringList.Create;
  tupla := 0;
  AssignFile(arqIn, strLocal + 'd_megasc.htm');
  Reset(arqIn);
  Readln(arqIn, linha); // pula a primeira
  arqLst.Insert(0, '<tr>');  // necessário para compatibilidade com tmpTop.htm
  while (not eof(arqIn)) do
  begin
    Readln(arqIn, linha);
    linha := trim(linha);
    if (linha <> '') then
    begin
      if (linha = '</table>') then
      begin
        arqLst.Add('</table>');
        arqLst.Add('</body>');
        arqLst.Add('</html>');
        break;
      end;
      if ((linha = '<tr>') or (linha = '<tr bgcolor=#D9E6F4>')) then
        tupla := -1;
      tupla := tupla + 1;
      arqLst.Insert(tupla, linha);
    end;
  end;
  CloseFile(arqIn);
  arqLst.SaveToFile(strLocal + 'tmpMain.htm');
  //mmLog.Lines.LoadFromFile(strLocal + 'tmpMain.htm');
  FreeAndNil(arqLst);
  log('Fim GerarTmpMain');
end;

//==================================================================================================
procedure TLoteria.btnGerarClick(Sender: TObject);
var
  arqTop, arqMain: TStringList;
begin
  GerarTmpMain;
  log('Início gerarTop');
  arqTop := TStringList.Create;
  arqMain := TStringList.Create;
  arqTop.LoadFromFile(strLocal + 'tmpTop.htm');
  arqMain.LoadFromFile(strLocal + 'tmpMain.htm');
  arqTop.AddStrings(arqMain);
  arqTop.SaveToFile(strLocal + 'top.htm');
  FreeAndNil(arqTop);
  FreeAndNil(arqMain);
  log('Fim gerarTop'); 
end;


end.
