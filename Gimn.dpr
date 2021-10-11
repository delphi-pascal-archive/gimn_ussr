program Gimn;

uses
  Forms,
  GimnUn in 'GimnUn.pas' {GimnFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGimnFrm, GimnFrm);
  Application.Run;
end.
