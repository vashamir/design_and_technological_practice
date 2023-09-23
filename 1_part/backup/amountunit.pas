unit AmountUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, AddUnit;

type

  { TAmountForm }

  TAmountForm = class(TForm)
    BackBB: TButton;
    Table: TStringGrid;
    procedure BackBBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  AmountForm: TAmountForm;

implementation

uses StartUnit;

{$R *.lfm}

{ TAmountForm }

procedure TAmountForm.BackBBClick(Sender: TObject);
begin
      AmountForm.Hide();
      StartForm.Show();
end;

procedure TAmountForm.FormShow(Sender: TObject);
  var j: integer;
begin
  Table.RowCount := pNumber + 2;
  j:=1;
  for i:=1 to pNumber+1 do begin
    Table.Cells[0, i]:= products[i].name;
    Table.Cells[1, i]:= IntToStr(products[i].count);
  end;
end;

end.

