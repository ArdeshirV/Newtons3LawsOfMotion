// Newtons3LawsOfMotion - Demonstrate Newton's Three Laws of Motion
// https://ardeshirv.github.io/Newtons3LawsOfMotion/
// Copyright© 2002-2004 ArdeshirV@protonmail.com, Licensed under GPLv3+
unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, ExtCtrls, Registry, StdCtrls,
  Buttons, MMSystem, XPMan, jpeg;

type
  TfrmMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    Help1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    CoolBar1: TCoolBar;
    Subject1: TMenuItem;
    ThirdNewtonlaw1: TMenuItem;
    SecondNewtonlaw2: TMenuItem;
    FirstNewtonlaw2: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    About1: TMenuItem;
    ToolButton5: TToolButton;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label9: TLabel;
    ProgressBar2: TProgressBar;
    Label10: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    lblBetween: TLabel;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    lblMotion: TLabel;
    Options1: TMenuItem;
    Music1: TMenuItem;
    XPManifest1: TXPManifest;
    btn: TBitBtn;
    sp: TToolButton;
    Image2: TImage;
    panel3: TPanel;
    ProductName: TLabel;
    Label11: TLabel;
    Version: TLabel;
    Image: TImage;
    Label12: TLabel;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure FirstNewtonlaw2Click(Sender: TObject);
    procedure SecondNewtonlaw2Click(Sender: TObject);
    procedure ThirdNewtonlaw1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure GlabalWorkOnSwitching;
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure Music1Click(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure Easyer;
 private
    NumberLaw: integer;
    Switch: boolean;
    Start: Boolean;
    bmp: TBitmap;
    ball: TBitmap;
    ball2: TBitmap;
    car: TBitmap;
    HS, WS: integer;
    IsResize: Boolean;
    xPos3: integer;
    xPos4: integer;
    st: integer;
    LxPos3: integer;
    xMov3: integer;
    UseMusic: Boolean;
    Speed1, Speed3: integer;
    T2, T3, T4, T5: integer;
    IsAbout, isre: boolean;
    xPos2: integer;
    blnbit: boolean;
    procedure PlaySplashSound(s: string);
  end;

var
  frmMainForm: TfrmMainForm;

implementation

uses UAboutBox, USplashForm;

const
  HB = 39;
  WB = 40;
  CAR1 = 'IDS_CAR';
  BOMB = 'IDS_BOMB';
  TICK = 'IDS_TICK';
  SWITCHMUSIC = 'IDS_SW';
  SPLASHSOUND = 'IDS_SPLASH';

{$R *.dfm}
{$R Newtons3LawsOfMotion.RES}


{ Event handlers }
procedure TfrmMainForm.About1Click(Sender: TObject);
var
  temp: Integer;
  dlg: TAboutBox;
begin
  temp := panel3.Left;
  panel3.Left := -700;
  PlaySound((SPLASHSOUND), 0, SND_RESOURCE or SND_ASYNC);
  IsAbout := True;
  dlg := TAboutBox.Create(Self);
  dlg.ShowModal;
  dlg.Free;
  IsAbout := False;
  panel3.Left := temp;
end;

procedure TfrmMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainForm.Print1Click(Sender: TObject);
begin
  Timer1Timer(nil);
  Print;
end;

procedure TfrmMainForm.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmMainForm.FirstNewtonlaw2Click(Sender: TObject);
begin
  if NumberLaw = 1 then
    Exit;
  FirstNewtonlaw2.Checked := True;
  SecondNewtonlaw2.Checked := False;
  ThirdNewtonlaw1.Checked := False;
  NumberLaw := 1;
  Easyer;
  panel1.Visible := false;
  Panel2.Visible := False;
  Trackbar1.Visible := true;
  label1.Visible := true;
  Trackbar1.Position := Speed1;
  Timer1.Interval := 100 - Speed1;
  btn.Visible := false;
  statusbar1.Panels[2].Text := 'Speed=' + IntToStr(TrackBar1.Position);
  statusbar1.Panels[1].Text := 'Inertia';
  GlabalWorkOnSwitching;
end;

procedure TfrmMainForm.SecondNewtonlaw2Click(Sender: TObject);
begin
  if NumberLaw = 2 then
    Exit;
  SecondNewtonlaw2.Checked := True;
  FirstNewtonlaw2.Checked := False;
  ThirdNewtonlaw1.Checked := False;
  NumberLaw := 2;
  Easyer;
  panel1.Visible := true;
  Panel2.Visible := False;
  Trackbar1.Visible := False;
  label1.Visible := False;
  Timer1.Interval := 50;
  btn.Visible := true;
  statusbar1.Panels[2].Text := '';
  statusbar1.Panels[1].Text := 'F=ma';
  GlabalWorkOnSwitching;
end;

procedure TfrmMainForm.ThirdNewtonlaw1Click(Sender: TObject);
begin
  if NumberLaw = 3 then
    Exit;
  StatusBar1.Panels[1].Text := 'Comments for third Newton law';
  ThirdNewtonlaw1.Checked := True;
  SecondNewtonlaw2.Checked := False;
  FirstNewtonlaw2.Checked := False;
  NumberLaw := 3;
  Easyer;
  panel1.Visible := false;
  Panel2.Visible := True;
  Trackbar1.Visible := True;
  label1.Visible := True;
  Timer1.Interval := 100 - Speed3;
  Trackbar1.Position := Speed3;
  btn.Visible := false;
  statusbar1.Panels[2].Text := 'Speed=' + IntToStr(TrackBar1.Position);
  statusbar1.Panels[1].Text := 'Action/Reaction';
  GlabalWorkOnSwitching;
end;

{ Toolbar Button Events Handler }
procedure TfrmMainForm.ToolButton2Click(Sender: TObject);
begin
  SecondNewtonlaw2Click(Sender);
end;

procedure TfrmMainForm.ToolButton3Click(Sender: TObject);
begin
  ThirdNewtonlaw1Click(Sender);
end;

procedure TfrmMainForm.ToolButton9Click(Sender: TObject);
begin
  Print1Click(Sender);
end;

procedure TfrmMainForm.ToolButton11Click(Sender: TObject);
begin
  About1Click(Sender);
end;

procedure TfrmMainForm.ToolButton1Click(Sender: TObject);
begin
  FirstNewtonlaw2Click(Sender);
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  Reg2: TRegistry;
  T, W, H, L: integer;
begin
  inherited;
  splash := TSplash.Create(Self);
  splash.ShowModal;
  Reg := TRegistry.Create;
  Reg2 := TRegistry.Create;
  try
   if (Reg.OpenKey('software\ArdeshirV\Newtons3LawsOfMotion', False))and
      (Reg2.OpenKey('software\ArdeshirV\Newtons3LawsOfMotion', True))then
    begin
      if Reg2.ReadString('Pasport')<> 'ArdeshirV' then
      begin
        Reg.Free;
        MessageBox(Handle, 'Error: Invalid user because '+
          'you are not Registered', 'Error', MB_OK or MB_ICONSTOP);
        Application.Terminate;
      end;
      T := Reg.ReadInteger('top');
      L := Reg.ReadInteger('left');
      W := Reg.ReadInteger('width');
      H := Reg.ReadInteger('height');
      SetBounds(L, T, W, H);
      WindowState := TWindowState(Reg.ReadInteger('WState'));
      UseMusic := Reg.ReadBool('Music');
      Speed1 := Reg.ReadInteger('Speed1');
      Speed3 := Reg.ReadInteger('Speed3');
      T2 := Reg.ReadInteger('T2');
      T3 := Reg.ReadInteger('T3');
      T4 := Reg.ReadInteger('T4');
      T5 := Reg.ReadInteger('T5');
    end;
  finally
    Reg.Free;
  end;
  Music1.Checked := UseMusic;
  FirstNewtonlaw2.Checked := False;
  SecondNewtonlaw2.Checked := False;
  ThirdNewtonlaw1.Checked := False;
  NumberLaw := 0;
  WS := WB;
  switch := true;
  WS := WB;
  IsResize := false;
  start := false;
  bmp := TBitmap.Create;
  ball := TBitmap.Create;
  ball2 := TBitmap.Create;
  car := TBitmap.Create;
  car := TBitmap.Create;
  car.LoadFromResourceName(HInstance, 'IDB_CAR');
  Bmp.LoadFromResourceName(HInstance, 'IDB_BACKGND');
  ball.LoadFromResourceName(HInstance, 'IDB_BALL');
  ball2.LoadFromResourceName(HInstance, 'IDB_BALL2');
  st := 0;
  LxPos3 := 0;
  xMov3 := 5;
  TrackBar2.Position := T2;
  TrackBar3.Position := T3;
  TrackBar4.Position := T4;
  TrackBar5.Position := T5;
  IsAbout := false;
  isre := false;
  TrackBar2Change(Sender);
  blnbit := true;
end;

procedure TfrmMainForm.Timer1Timer(Sender: TObject);
  procedure DrawBalls(C: TCanvas; pos, y, num: integer; bln : boolean = true);
  var
    i: integer;
  begin
    if bln then
    begin
      for i := 0 to num - 1 do
        c.Draw(pos + WB * i, y + 30 + ClientHeight div 2, ball);
    end
    else
    begin
      for i := 0 to num - 1 do
      begin
        c.Draw(pos + WB * i, y + 30 + ClientHeight div 2, ball2);
      end;
    end;
  end;

{$J+}
const
  int: integer = 0;
  bln: boolean = true;
  Lock: boolean = false;
  WelcomeText: String = 'Newton Motion Laws';
  xPos: integer = 0;
  LxPos: integer = 0;
  yPos: integer = 34;
  LyPos: integer = 0;
  xMov: integer = 12;
  yMov: Integer = 10;
  xMov2:integer = 0;
{$J-}

var
  rect: TRect;
  space: TRect;
  WorkSpace: TBitmap;

label
  Farar;

begin
  Application.ProcessMessages;
  if bln then
  begin
    if int = 0 then
      PlaySound(PChar(SPLASHSOUND), 0, SND_RESOURCE or SND_ASYNC)
    else if int = 40 then
    begin
      splash.Close;
      bln := False;
    end;
    inc(int);
    Exit;
  end;

  WorkSpace := TBitmap.Create;
  WorkSpace.Width := ClientWidth;
  WorkSpace.Height := ClientHeight;
  if IsResize then
  begin
    xPos := 1;
    yPos := 34;
    IsResize := false;
  end;

  case NumberLaw of
    0:
    begin
      Panel3.Visible := true;
    end;
    1:(* First Law.*)//////////////////////////////////////////////////////////
    begin
      if switch then
      begin
        xMov := 7;
        yMov := 5;
        xPos := 0;
        yPos := 33;
      end;
      xPos := xPos + xMov;
      yPos := yPos + yMov;
      rect.Left := LxPos;
      rect.Top := LyPos;
      rect.Right := WB + LxPos;
      rect.Bottom := HB + LyPos;
      if(yPos + HB + 25 >= ClientHeight) or (yPos <= 33) then
      begin
        yMov := -yMov;
        PlaySplashSound(TICK);
      end;
      if (xPos + WB >= ClientWidth) or (xPos <= 0) then
      begin
        xMov := -xMov;
        PlaySplashSound(TICK);
      end;
      WorkSpace.Canvas.Draw(xPos, yPos, ball);
    end;
    2:(* Second Law.*)/////////////////////////////////////////////////////////
    begin
      if Switch then
      begin
        xPos2 := ClientWidth;
        xMov2 := 0;
      end;
      if Start then
      begin
        xMov2 := Trackbar3.Position div 4 + xMov2;
        Dec(xPos2, xMov2);
        if xPos2 <= 0 then
        begin
          start := false;
          xPos2 := 0;
          blnbit := true;
            PlaySplashSound(CAR1);
        end;
      end
      else if(isre)then
      begin
        isre := false;
        xPos2 := ClientWidth;
      end;
      space.Left := xPos2;
      space.Top := 200;
      space.Right := xPos2 + WS * 2;
      space.Bottom := 200 + HS;
      WorkSpace.Canvas.StretchDraw(space, car);
      WorkSpace.Canvas.MoveTo(15, HS + 210);
      WorkSpace.Canvas.LineTo(0, HS + 215);
      WorkSpace.Canvas.LineTo(15,HS + 220);
      WorkSpace.Canvas.MoveTo(0, HS + 215);
      WorkSpace.Canvas.LineTo(ClientWidth, HS + 215);
      WorkSpace.Canvas.LineTo(ClientWidth - 15, HS + 210);
      WorkSpace.Canvas.MoveTo(ClientWidth, HS + 215);
      WorkSpace.Canvas.LineTo(ClientWidth - 15, HS + 220);
      WorkSpace.Canvas.Font.Size := 10;
      WorkSpace.Canvas.TextOut((ClientWidth div 2)- 20, HS + 210,'d=( ' +
        IntToStr(ClientWidth) + ' )');
    end;
    3:(* Third Law.*)//////////////////////////////////////////////////////////
    begin
      if (Trackbar4.Position = 0) or (Trackbar5.Position = 0) then
        Goto Farar;
      if switch then
      begin
        xPos3 := 0;
        xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
        st := 0;
        if xMov3 < 0 then
          xMov3 := -xMov3;
      end;
      if st = 0 then
      begin
        DrawBalls(WorkSpace.Canvas, xPos3, 20, Trackbar5.Position, false);
        DrawBalls(WorkSpace.Canvas, xPos4, 20, Trackbar4.Position, false);
        if(xPos3 + WB * Trackbar5.Position >= xPos4)then
        begin
          PlaySplashSound(TICK);
          LxPos3 := xPos3;
          xPos3 := ((ClientWidth - WB * Trackbar4.Position)div 2) +
          WB*(TrackBar4.Position-TrackBar5.Position);
          st := 1;
        end;
      end
      else if st = 1 then
      begin
          DrawBalls(WorkSpace.Canvas, LxPos3, 20, Trackbar4.Position, false);
          DrawBalls(WorkSpace.Canvas, xPos3, 20, TrackBar5.Position, false);
        if(ClientWidth - TrackBar5.Position * WB) <= xPos3 then
        begin
          PlaySplashSound(TICK);
          st := 2;
          xMov3 := -xMov3;
        end;
      end
      else if st = 2 then
      begin
        DrawBalls(WorkSpace.Canvas, LxPos3, 20, Trackbar4.Position, false);
        DrawBalls(WorkSpace.Canvas, xPos3, 20, TrackBar5.Position, false);
        if((ClientWidth - WB * Trackbar4.Position)div 2) +
          WB *(TrackBar4.Position - TrackBar5.Position) >= xPos3 then
        begin
          st := 3;
          PlaySplashSound(TICK);
        end;
      end
      else if st = 3 then
      begin
        DrawBalls(WorkSpace.Canvas, xPos4, 20, TrackBar4.Position, false);
        DrawBalls(WorkSpace.Canvas, LxPos3, 20, Trackbar5.Position, false);
        inc(LxPos3, xMov3);
        if LxPos3 <= 0 then
        begin
          PlaySplashSound(TICK);
          xMov3 := -xMov3;
          xPos3 := 0;
          xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
          st := 0;
        end;
      end;
      inc(xPos3, xMov3);
      (* for debugging and to see Variable value *)
      {WorkSpace.Canvas.MoveTo(xPos3, 30);WorkSpace.Canvas.LineTo(xPos3, 100);
      WorkSpace.Canvas.MoveTo(xPos4, 30);WorkSpace.Canvas.LineTo(xPos4, 300);
      WorkSpace.Canvas.MoveTo(LxPos3, 30);WorkSpace.Canvas.LineTo(LxPos3, 300);
      WorkSpace.Canvas.MoveTo(((ClientWidth - WB * Trackbar4.Position)div 2) +
          WB *(TrackBar4.Position - TrackBar5.Position), 30);
      WorkSpace.Canvas.LineTo(((ClientWidth - WB * Trackbar4.Position)div 2) +
          WB *(TrackBar4.Position - TrackBar5.Position), 200);}
    end;
  end;
  Farar:
  switch := false;
  Canvas.Draw(0, 0, WorkSpace);
  WorkSpace.Free;
end;

procedure TfrmMainForm.FormPaint(Sender: TObject);
var
  rect: TRect;
begin
  rect.Top := 0;
  rect.Left := 0;
  rect.Right := Width;
  rect.Bottom := Height;
  canvas.StretchDraw(rect, Bmp);
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.OpenKey('software\saeed\newton', true);
    Reg.WriteInteger('WState', ord(WindowState));
    Reg.WriteInteger('top', top);
    Reg.WriteInteger('left', left);
    Reg.WriteInteger('height', height);
    Reg.WriteInteger('width', Width);
    Reg.WriteBool('Music', UseMusic);
    Reg.WriteInteger('Speed1', Speed1);
    Reg.WriteInteger('Speed3', Speed3);
    Reg.WriteInteger('T2', T2);
    Reg.WriteInteger('T3', T3);
    Reg.WriteInteger('T4', T4);
    Reg.WriteInteger('T5', T5);
  finally
    Reg.Free;
    Bmp.Free;
    ball.Free;
    ball2.Free;
    car.Free;
  end;
end;

procedure TfrmMainForm.FormResize(Sender: TObject);
begin
  IsResize := true;
  Progressbar2.Position := Progressbar1.Position * ClientHeight;
  Progressbar2.Position := (Progressbar1.Position * ClientWidth);
  label10.Caption:=IntToStr(Progressbar2.Position div 1000) + ' KJ';
  Panel2.Left := (ClientWidth - Panel2.Width)div 2;
  Panel1.Left := (ClientWidth - Panel1.Width)div 2;
  Panel3.Left := (ClientWidth - Panel3.Width)div 2;
  st := 0;
  LxPos3 := 0;
  xPos3 := 0;
  xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
  if xMov3 < 0 then
    xMov3 := -xMov3;
  if xPos2 <> 0 then
    isre := True;
end;

procedure TfrmMainForm.TrackBar1Change(Sender: TObject);
var
  sp: integer;
begin
  sp := TrackBar1.Position;
  Timer1.Interval := 100 - sp;
  statusbar1.Panels[2].Text := 'Speed=' + IntToStr(sp);
  if NumberLaw = 1 then
    Speed1 := sp
  else if NumberLaw = 3 then
    SPeed3 := sp;
end;

procedure TfrmMainForm.TrackBar2Change(Sender: TObject);
begin
  Progressbar1.Position := Trackbar2.position * TrackBar3.Position;
  Label5.Caption := IntToStr(Trackbar2.position) + ' Kg';
  label7.Caption := IntToStr(Progressbar1.Position) + ' N';
  HS := HB +(Trackbar2.position div 20);
  WS := WB +(Trackbar2.position div 20);
  Progressbar2.Position := (Progressbar1.Position * ClientWidth);
  label10.Caption := IntToStr(Progressbar2.Position div 1000)+ ' KJ';
  T2 := Trackbar2.position;
end;

procedure TfrmMainForm.TrackBar3Change(Sender: TObject);
begin
  Progressbar1.Position := Trackbar2.position * TrackBar3.Position;
  label6.Caption := IntToStr(TrackBar3.Position)+ ' m/s^2';
  label7.Caption := IntToStr(Progressbar1.Position)+ ' N';
  Progressbar2.Position := (Progressbar1.Position * ClientWidth);
  label10.Caption := IntToStr(Progressbar2.Position div 1000)+ ' KJ';
  T3 := TrackBar3.Position;
end;

procedure TfrmMainForm.PlaySplashSound(s:string);
begin
  if (UseMusic)and(not IsAbout)then
    PlaySound(PChar(s), 0, SND_RESOURCE or SND_ASYNC)
end;

procedure TfrmMainForm.TrackBar4Change(Sender: TObject);
begin
  lblBetween.Caption := '&Between balls: '+ IntToStr(TrackBar4.Position);
  xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
  st := 0;
  LxPos3 := 0;
  xPos3 := 0;
  xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
  if xMov3 < 0 then
    xMov3 := -xMov3;
  T4 := TrackBar4.Position;
end;

procedure TfrmMainForm.TrackBar5Change(Sender: TObject);
begin
  lblMotion.Caption := '&Motion balls: '+ IntToStr(Trackbar5.Position);
  st := 0;
  LxPos3 := 0;
  xPos3 := 0;
  xPos4 := (ClientWidth - WB * Trackbar4.Position)div 2;
  if xMov3 < 0 then
    xMov3 := -xMov3;
  T5 := TrackBar5.Position;
end;

procedure TfrmMainForm.Music1Click(Sender: TObject);
begin
  UseMusic := not UseMusic;
  Music1.Checked := UseMusic;
end;

procedure TfrmMainForm.btnClick(Sender: TObject);
begin
  if blnbit then
  begin
    start := true;
    switch := true;
    blnbit := false;
  end;
end;

procedure TfrmMainForm.GlabalWorkOnSwitching;
begin
  PlaySplashSound(SWITCHMUSIC);
  Panel3.Visible := false;
end;

procedure TfrmMainForm.Easyer;
begin
  switch := true;
  Refresh;
end;

end.

