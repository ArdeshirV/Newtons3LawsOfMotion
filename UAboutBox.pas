// Newtons3LawsOfMotion - Demonstrates Newton's Three Laws of Motion
// https://ardeshirv.github.io/Newtons3LawsOfMotion/
// Copyright© 2002-2004 ArdeshirV@protonmail.com, Licensed under GPLv3+
unit UAboutBox;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, XPMan;

type
  TAboutBox = class(TForm)
    Panel: TPanel;
    ProductName: TLabel;
    Label2: TLabel;
    Version: TLabel;
    Image: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
  self.Close;
end;

end.



























































                                                                                                                      //Copyright© Saeed Tavakolian.
