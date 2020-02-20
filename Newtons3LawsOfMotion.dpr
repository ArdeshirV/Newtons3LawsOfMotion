// Newtons3LawsOfMotion - Demonstrates Newton's Three Laws of Motion
// https://ardeshirv.github.io/Newtons3LawsOfMotion/
// Copyright© 2002-2004 ArdeshirV@protonmail.com, Licensed under GPLv3+
program Newtons3LawsOfMotion;

uses
  Forms,
  UMainForm in 'UMainForm.pas',
  UAboutBox in 'UAboutBox.pas',
  USplashForm in 'USplashForm.pas';

{$E exe}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Newtons3LawsOfMotion';
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
