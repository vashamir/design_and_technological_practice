unit PeriodUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, AddUnit;

type

  { TPeriodForm }

  TPeriodForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  PeriodForm: TPeriodForm;

implementation

uses StartUnit;

{$R *.lfm}

{ TPeriodForm }



procedure TPeriodForm.Button1Click(Sender: TObject);
          var t1, t2: TDateTime;
            cproduct : TProduct;
begin
  t1:= StrToDate(Edit1.Text);
  t2:= StrToDate(Edit2.TExt);
  reset(f);
  i := 1;
  while not (EOF(f)) do
    begin
         read(f, cproduct);
         if(cproduct.date >= t1) and (cproduct.date <= t2) then begin
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
            StringGrid1.Cells[0, StringGrid1.RowCount - 1]:= DateToStr(products[i].date);
            StringGrid1.Cells[1, StringGrid1.RowCount - 1]:= products[i].name;
            StringGrid1.Cells[2, StringGrid1.RowCount - 1]:= products[i].country;
         end;
         i:= i + 1;
    end;


end;

procedure TPeriodForm.Button2Click(Sender: TObject);
begin
  PeriodForm.Hide();
      StartForm.Show();
end;

procedure TPeriodForm.FormShow(Sender: TObject);
begin
  StringGrid1.RowCount := 1;
end;


end.

