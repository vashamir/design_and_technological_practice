unit AddUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TAddForm }

  TAddForm = class(TForm)
    AddB: TButton;
    BackB: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure AddBClick(Sender: TObject);
    procedure BackBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WriteProductsToFile();
  private

  public

  end;




var
  AddForm: TAddForm;



implementation

uses StartUnit;

{$R *.lfm}

{ TAddForm }

procedure TAddForm.FormCreate(Sender: TObject);
begin
      pNumber := 0;
end;

procedure TAddForm.AddBClick(Sender: TObject);
     var correct:boolean = true;
begin
  if (Edit1.Text='') then begin
    MessageDlg('Incorrect name',mtConfirmation,mbYesNoCancel,0);
    correct:=false;
    Edit1.Clear;
  end;
  if (Edit2.Text='') then begin
    MessageDlg('Incorrect date',mtConfirmation,mbYesNoCancel,0);
    correct:=false;
    Edit2.Clear;
  end;
  if (Edit3.Text='') or (StrToInt(Edit3.Text) < 1) then begin
    MessageDlg('Incorrect amount of product', mtConfirmation, mbYesNoCancel,0);
    correct:=false;
    Edit3.Clear;
  end;
  if (Edit4.Text='') then begin
    MessageDlg('Incorrect country',mtConfirmation,mbYesNoCancel,0);
    correct:=false;
    Edit4.Clear;
  end;

   if correct then begin
     StartForm.ReadProductsFromFile();
    product.name := Edit1.Text;
    product.date := StrToDate(Edit2.Text);
    product.count := StrToInt(Edit3.Text);
    product.country := Edit4.Text;
    pNumber := pNumber + 1;
    products[pNumber] := product;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit1.SetFocus;
    AddForm.WriteProductsToFile();
    end;
end;

procedure TAddForm.BackBClick(Sender: TObject);
begin
      AddForm.Hide();
      StartForm.Show();
end;

procedure TAddForm.WriteProductsToFile();
begin
  rewrite(f);
  for i:=1 to pNumber do begin
    write(f, products[i]);
  end;
  CloseFile(f);
end;







end.

