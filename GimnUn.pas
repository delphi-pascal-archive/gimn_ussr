unit GimnUn;

interface

uses DelphiProcUn,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TGimnFrm = class(TForm)
    Lab: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure GimnSov;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GimnFrm: TGimnFrm;

implementation

{$R *.dfm}

const
  speed = 50;
  k     = 40;  //20;
  //
  do1   = 130;
  re    = 147;
  mi    = 165;
  fa    = 175;
  sol   = 196;
  la    = 220;
  si    = 247;
  do2   = 262;
  re2   = 294;
  mi2   = 330;

{
Темп 112   Мелодия для Nokia

8g1 4c2 8g1 8a1 4b1 8e1 8e1 4a1 8g1 8f1 4g1 8c1
8c1 4d1 8d1 8e1 4f1 8f1 8g1 4a1 8b1 8c2 4d2

до  ре  ми  фа  соль  ля  си
c   d   e   f    g    a   b
}

  c1   = 130;   // до
  d1   = 147;   // ре
  e1   = 165;   // ми
  f1   = 175;   // фа
  g1   = 196;   // соль
  a1   = 220;   // ля
  b1   = 247;   // си
  c2   = 262;   // до
  d2   = 294;   // ре
  e2   = 330;   // ми

  Mel : Array[0..22, 0..1] of Word =
             ((g1, 10000), (c2, 30000), (g1, 20000), (a1, 10000),
              (b1, 30000), (e1, 20000), (e1, 10000), (a1, 30000),
              (g1, 20000), (f1, 10000), (g1, 30000), (c1, 20000),

              (c1, 15000), (d1, 30000), (d1, 15000), (e1, 15000),
              (f1, 30000), (f1, 15000), (g1, 15000), (a1, 30000),
              (b1, 15000), (c2, 15000), (d2, 40000));

  Txt : Array[0..22] of String =
             (('Со'),   ('юз '),  ('не'),  ('ру'),
              ('ши'),   ('мый '), ('рес'), ('пуб'),
              ('лик '), ('сво'),  ('бод'), ('ных '),

              ('Спло'), ('ти'),   ('ла '), ('на'),
              ('ве'),   ('ки '),  ('Ве'),  ('ли'),
              ('ка'),   ('я '),   ('Русь'));

{
  Mel : Array[0..22, 0..1] of Word =
             ((sol, 10000),(do2, 30000),(sol, 20000), (la, 10000),
               (si, 30000), (mi, 20000), (mi, 10000), (la, 30000),
              (sol, 20000), (fa, 10000),(sol, 30000),(do1, 20000),

              (do1, 15000), (re, 30000), (re, 15000), (mi, 15000),
              (fa, 30000),  (fa, 15000),(sol, 15000), (la, 30000),
              (si, 15000), (do2, 15000),(re2, 50000));
}

procedure Delay_Wait(amSecs : Integer); 
var
 h: THandle;
begin
 h:=CreateEvent(nil, true, false, '');
 WaitForSingleObject(h, amSecs);
 Closehandle(h);
end;

procedure TGimnFrm.GimnSov;
var
 i: integer;
begin
 Lab.Caption := '';
 for I := 0 to 22 do
  begin
   Lab.Caption := Lab.Caption + Txt[I];
   Application.ProcessMessages;
   ExBeep(Mel[I, 0], Mel[I, 1] div k);
   if I = 11 then Delay_Wait(50);
  end;
end;

procedure TGimnFrm.Button1Click(Sender: TObject);
begin
 GimnSov;
end;

end.
