unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, CheckLst, Menus;

type

  { TForm1 }


  TForm1 = class(TForm)
    btIniciar: TButton;
    btSair: TButton;
    btInventario: TButton;
    btProximo: TButton;
    C1Armario: TImage;
    C1C4: TImage;
    C1C2: TImage;
    C1Cama: TImage;
    C1Lareira: TImage;
    C1Quadro: TImage;
    C2C5: TImage;
    C2C1: TImage;
    C2C6: TImage;
    C2C3: TImage;
    C3Corpo: TImage;
    C3Pergaminho: TImage;
    C3Livros: TImage;
    C3C2: TImage;
    C3C7: TImage;
    imFundo: TImage;
    lbTitulo: TLabel;
    Inventario: TListBox;
    MemoTexto: TMemo;
    Shape1: TShape;
    procedure btIniciarClick(Sender: TObject);
    procedure btInventarioClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure C1ArmarioClick(Sender: TObject);
    procedure C1ArmarioMouseEnter(Sender: TObject);
    procedure C1ArmarioMouseLeave(Sender: TObject);
    procedure C1C2Click(Sender: TObject);
    procedure C1C2MouseEnter(Sender: TObject);
    procedure C1C2MouseLeave(Sender: TObject);
    procedure C1C4Click(Sender: TObject);
    procedure C1C4MouseEnter(Sender: TObject);
    procedure C1C4MouseLeave(Sender: TObject);
    procedure C1LareiraClick(Sender: TObject);
    procedure C1LareiraMouseEnter(Sender: TObject);
    procedure C1LareiraMouseLeave(Sender: TObject);
    procedure C1QuadroClick(Sender: TObject);
    procedure C1QuadroMouseEnter(Sender: TObject);
    procedure C1QuadroMouseLeave(Sender: TObject);
    procedure C2C1Click(Sender: TObject);
    procedure C2C1MouseEnter(Sender: TObject);
    procedure C2C1MouseLeave(Sender: TObject);
    procedure C2C3Click(Sender: TObject);
    procedure C2C3MouseEnter(Sender: TObject);
    procedure C2C3MouseLeave(Sender: TObject);
    procedure C2C5Click(Sender: TObject);
    procedure C2C5MouseEnter(Sender: TObject);
    procedure C2C5MouseLeave(Sender: TObject);
    procedure C2C6Click(Sender: TObject);
    procedure C2C6MouseEnter(Sender: TObject);
    procedure C2C6MouseLeave(Sender: TObject);
    procedure C3C2Click(Sender: TObject);
    procedure C3C2MouseEnter(Sender: TObject);
    procedure C3C2MouseLeave(Sender: TObject);
    procedure C3C7Click(Sender: TObject);
    procedure C3C7MouseEnter(Sender: TObject);
    procedure C3C7MouseLeave(Sender: TObject);
    procedure C3CorpoClick(Sender: TObject);
    procedure C3CorpoMouseEnter(Sender: TObject);
    procedure C3CorpoMouseLeave(Sender: TObject);
    procedure C3LivrosClick(Sender: TObject);
    procedure C3LivrosMouseEnter(Sender: TObject);
    procedure C3LivrosMouseLeave(Sender: TObject);
    procedure C3PergaminhoClick(Sender: TObject);
    procedure C3PergaminhoMouseEnter(Sender: TObject);
    procedure C3PergaminhoMouseLeave(Sender: TObject);
    procedure ConfigurableTimerTimer(Sender: TObject);
    procedure C1CamaClick(Sender: TObject);
    procedure C1CamaMouseEnter(Sender: TObject);
    procedure C1CamaMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

var
  EstadoProximo :Byte;
  DetectorDialogo:Boolean;
  ChaveArmario:Boolean;
  ChaveBanheiro:Boolean;
  Revolver9mm:Boolean;
  VoltaQuarto:Boolean;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Color := clBlack;
end;

procedure TForm1.btIniciarClick(Sender: TObject);
begin
  lbTitulo.Visible := False;
  btInventario.visible := True;
  btProximo.visible := True;
  btIniciar.Visible := False;
  MemoTexto.Visible := True;
  MemoTexto.Lines.LoadFromFile('Textos\CIT1.txt');
  EstadoProximo := 0;
  DetectorDialogo := True;
  VoltaQuarto := False;
  ChaveArmario:= False;
  ChaveBanheiro:= False;
  Revolver9mm:= False;
  Inventario.Items.Clear;
end;

procedure TForm1.btInventarioClick(Sender: TObject);
begin
  if (Inventario.Visible = True) then
     Inventario.Visible := False
  else
     Inventario.Visible := True;
end;

procedure TForm1.btProximoClick(Sender: TObject);
begin
  if (EstadoProximo=0) then
  begin
     C1Lareira.Visible := True;
     C1Quadro.Visible := True;
     C1Cama.Visible := True;
     C1Armario.Visible := True;
     C1C4.Visible := True;
     C1C2.Visible := True;
     btProximo.Visible := False;
     imFundo.Picture.LoadFromFile('Imagens\CenaQuarto.JPG');
     DetectorDialogo := True;
     if (VoltaQuarto = False) then
        MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
     else
        MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;

  if (EstadoProximo=10) then
  begin
     C2C1.Visible := True;
     C2C3.Visible := True;
     C2C5.Visible := True;
     C2C6.Visible := True;
     MemoTexto.Lines.LoadFromFile('Textos\C2T1.txt');
     btProximo.Visible := False;
     imFundo.Picture.LoadFromFile('Imagens\CenaCorredor.JPG');
     DetectorDialogo := True;
  end;

   if (EstadoProximo=20) then
  begin
     C3C2.Visible := True;
     C3C7.Visible := True;
     C3Pergaminho.Visible := True;
     C3Corpo.Visible := True;
     C3Livros.Visible := True;
     MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
     btProximo.Visible := False;
     imFundo.Picture.LoadFromFile('Imagens\CenaSala.JPG');
     DetectorDialogo := True;
  end;

  if (EstadoProximo=254) then
  begin
     lbTitulo.Caption := 'MISSING';
     btIniciar.Visible := True;
     btProximo.Visible := False;
  end;

  if (EstadoProximo=255) then
  begin
     lbTitulo.Visible := True;
     lbTitulo.Caption := 'VOCE MORREU';
     MemoTexto.Caption := '';
     EstadoProximo:=254;
  end;

  if (EstadoProximo=250) then
  begin
     lbTitulo.Visible := True;
     lbTitulo.Caption := 'O FIM?';
     MemoTexto.Caption := '';
     EstadoProximo:=254;
  end;
end;

procedure TForm1.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.C1ArmarioClick(Sender: TObject);
begin
  if (ChaveArmario = True) then
  begin
    MemoTexto.Lines.LoadFromFile('Textos\C1ArmarioGO1.txt');
    if (Revolver9mm = False) then
    begin
       Revolver9mm := True;
       Inventario.Items.Add('Revolver9mm');
    end;
  end
  else
    MemoTexto.Lines.LoadFromFile('Textos\C1ArmarioGO0.txt');
end;

procedure TForm1.C1ArmarioMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1ArmarioEN.txt');
end;

procedure TForm1.C1ArmarioMouseLeave(Sender: TObject);
begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
end;

procedure TForm1.C1C2Click(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1C2GO.txt');
  C1Lareira.Visible := False;
  C1Quadro.Visible := False;
  C1Cama.Visible := False;
  C1Armario.Visible := False;
  C1C4.Visible := False;
  C1C2.Visible := False;
  btProximo.Visible := True;
  EstadoProximo := 10;
  VoltaQuarto := True;
  DetectorDialogo := False;
end;

procedure TForm1.C1C2MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1C2EN.txt');
end;

procedure TForm1.C1C2MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
  begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;
end;

procedure TForm1.C1C4Click(Sender: TObject);
begin
   if (ChaveBanheiro = False) then
      MemoTexto.Lines.LoadFromFile('Textos\C1C4GO0.txt')
   else
   begin
      btInventario.Visible := False;
      Inventario.Visible := False;
      imFundo.Picture.Clear;
      C1Lareira.Visible := False;
      C1Quadro.Visible := False;
      C1Cama.Visible := False;
      C1Armario.Visible := False;
      C1C4.Visible := False;
      C1C2.Visible := False;
      btProximo.Visible := True;
      EstadoProximo := 250;
      DetectorDialogo := False;
      MemoTexto.Lines.LoadFromFile('Textos\C1C4GO1.txt');
   end;
end;

procedure TForm1.C1C4MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1C4EN.txt');
end;

procedure TForm1.C1C4MouseLeave(Sender: TObject);
begin
  if(DetectorDialogo = True) then
  begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;
end;

procedure TForm1.C1LareiraClick(Sender: TObject);
begin
  imFundo.Picture.Clear;
  EstadoProximo := 255;
  DetectorDialogo := False;
  C1Lareira.Visible := False;
  C1Quadro.Visible := False;
  C1Cama.Visible := False;
  C1Armario.Visible := False;
  C1C4.Visible := False;
  C1C2.Visible := False;
  btInventario.Visible := False;
  Inventario.Visible := False;
  btProximo.Visible := True;
  MemoTexto.Lines.LoadFromFile('Textos\C1LareiraGO.txt');
end;


procedure TForm1.C1LareiraMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1LareiraEN.txt');
end;

procedure TForm1.C1LareiraMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
  begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;
end;

procedure TForm1.C1QuadroClick(Sender: TObject);
begin
  imFundo.Picture.Clear;
  EstadoProximo := 255;
  DetectorDialogo := False;
  C1Lareira.Visible := False;
  C1Quadro.Visible := False;
  C1Cama.Visible := False;
  C1Armario.Visible := False;
  C1C4.Visible := False;
  C1C2.Visible := False;
  btInventario.Visible := False;
  Inventario.Visible := False;
  btProximo.Visible := True;
  MemoTexto.Lines.LoadFromFile('Textos\C1QuadroGO.txt');
end;

procedure TForm1.C1QuadroMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1QuadroEN.txt');
end;

procedure TForm1.C1QuadroMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
  begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;
end;

procedure TForm1.C2C1Click(Sender: TObject);
begin
  C2C1.Visible := False;
  C2C3.Visible := False;
  C2C5.Visible := False;
  C2C6.Visible := False;
  MemoTexto.Lines.LoadFromFile('Textos\C2C1GO.txt');
  btProximo.Visible := True;
  DetectorDialogo := False;
  EstadoProximo := 0;
end;

procedure TForm1.C2C1MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C2C1EN.txt');
end;

procedure TForm1.C2C1MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
     MemoTexto.Lines.LoadFromFile('Textos\C2T1.txt');
end;

procedure TForm1.C2C3Click(Sender: TObject);
begin
  C2C1.Visible := False;
  C2C3.Visible := False;
  C2C5.Visible := False;
  C2C6.Visible := False;
  MemoTexto.Lines.LoadFromFile('Textos\C2C3GO.txt');
  btProximo.Visible := True;
  DetectorDialogo := False;
  EstadoProximo := 20;
end;

procedure TForm1.C2C3MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C2C3EN.txt');
end;

procedure TForm1.C2C3MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
     MemoTexto.Lines.LoadFromFile('Textos\C2T1.txt');
end;

procedure TForm1.C2C5Click(Sender: TObject);
begin
  imFundo.Picture.Clear;
  EstadoProximo := 255;
  DetectorDialogo := False;
  C2C1.Visible := False;
  C2C3.Visible := False;
  C2C5.Visible := False;
  C2C6.Visible := False;
  btInventario.Visible := False;
  Inventario.Visible := False;
  btProximo.Visible := True;
  MemoTexto.Lines.LoadFromFile('Textos\C2C5GO.txt');
end;

procedure TForm1.C2C5MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C2C5EN.txt');
end;

procedure TForm1.C2C5MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
     MemoTexto.Lines.LoadFromFile('Textos\C2T1.txt');
end;

procedure TForm1.C2C6Click(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C2C6GO.txt');
end;

procedure TForm1.C2C6MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C2C6EN.txt');
end;

procedure TForm1.C2C6MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
     MemoTexto.Lines.LoadFromFile('Textos\C2T1.txt');
end;

procedure TForm1.C3C2Click(Sender: TObject);
begin
  C3C2.Visible := False;
  C3C7.Visible := False;
  C3Pergaminho.Visible := False;
  C3Corpo.Visible := False;
  C3Livros.Visible := False;
  MemoTexto.Lines.LoadFromFile('Textos\C3C2GO.txt');
  btProximo.Visible := True;
  DetectorDialogo := False;
  EstadoProximo := 10;
end;

procedure TForm1.C3C2MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3C2EN.txt');
end;

procedure TForm1.C3C2MouseLeave(Sender: TObject);
begin
    if (DetectorDialogo = True) then
      MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
end;

procedure TForm1.C3C7Click(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3C7GO.txt');
end;

procedure TForm1.C3C7MouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3C7EN.txt');
end;

procedure TForm1.C3C7MouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
      MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
end;

procedure TForm1.C3CorpoClick(Sender: TObject);
begin
  if (Revolver9mm = False) then
  begin
    C3C2.Visible := False;
    C3C7.Visible := False;
    C3Pergaminho.Visible := False;
    C3Corpo.Visible := False;
    C3Livros.Visible := False;
    imFundo.Picture.Clear;
    MemoTexto.Lines.LoadFromFile('Textos\C3CorpoGO.txt');
    btProximo.Visible := True;
    DetectorDialogo := False;
    EstadoProximo := 255;
  end
  else
  begin
    if (ChaveBanheiro = False) then
    begin
      MemoTexto.Lines.LoadFromFile('Textos\C3CorpoGOB.txt');
      ChaveBanheiro := True;
      Inventario.Items.Add('Chave do Banheiro');
    end
    else
      MemoTexto.Lines.LoadFromFile('Textos\C3CorpoGOC.txt');
  end;
end;

procedure TForm1.C3CorpoMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3CorpoEN.txt');
end;

procedure TForm1.C3CorpoMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
      MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
end;

procedure TForm1.C3LivrosClick(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3LivrosGO.txt');
end;

procedure TForm1.C3LivrosMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3LivrosEN.txt');
end;

procedure TForm1.C3LivrosMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
      MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
end;

procedure TForm1.C3PergaminhoClick(Sender: TObject);
begin
  if (ChaveArmario = False) then
  begin
     Inventario.Items.Add('Chave do armário');
     ChaveArmario := True;
     MemoTexto.Lines.LoadFromFile('Textos\C3PergaminhoGO.txt');
  end
  else
     MemoTexto.Lines.LoadFromFile('Textos\C3PergaminhoGOB.txt');
end;

procedure TForm1.C3PergaminhoMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C3PergaminhoEN.txt');
end;

procedure TForm1.C3PergaminhoMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
      MemoTexto.Lines.LoadFromFile('Textos\C3T1.txt');
end;

procedure TForm1.ConfigurableTimerTimer(Sender: TObject);
begin

end;

procedure TForm1.C1CamaClick(Sender: TObject);
begin
  imFundo.Picture.Clear;
  EstadoProximo := 255;
  DetectorDialogo := False;
  C1Lareira.Visible := False;
  C1Quadro.Visible := False;
  C1Cama.Visible := False;
  C1Armario.Visible := False;
  C1C4.Visible := False;
  C1C2.Visible := False;
  btInventario.Visible := False;
  Inventario.Visible := False;
  btProximo.Visible := True;
  MemoTexto.Lines.LoadFromFile('Textos\C1CamaGO.txt');
end;

procedure TForm1.C1CamaMouseEnter(Sender: TObject);
begin
  MemoTexto.Lines.LoadFromFile('Textos\C1CamaEN.txt');
end;

procedure TForm1.C1CamaMouseLeave(Sender: TObject);
begin
  if (DetectorDialogo = True) then
  begin
    if (VoltaQuarto = False) then
       MemoTexto.Lines.LoadFromFile('Textos\C1T1.txt')
    else
       MemoTexto.Lines.LoadFromFile('Textos\C1T1B.txt');
  end;
end;


end.

