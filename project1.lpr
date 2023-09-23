program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, StartUnit, AddUnit, DeleteUnit, AvailabilityUnit, AmountUnit,
  PeriodUnit, GraphUnit
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.CreateForm(TDeleteForm, DeleteForm);
  Application.CreateForm(TAvailabilityForm, AvailabilityForm);
  Application.CreateForm(TAmountForm, AmountForm);
  Application.CreateForm(TPeriodForm, PeriodForm);
  Application.CreateForm(TGraphForm, GraphForm);
  Application.Run;
end.

