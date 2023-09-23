unit AvailabilityUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, AddUnit;

type

  { TAvailabilityForm }

  TAvailabilityForm = class(TForm)
    BackBut: TButton;
    FindButton: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BackButClick(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
  private

  public

  end;

var
  AvailabilityForm: TAvailabilityForm;


implementation

uses StartUnit;

{$R *.lfm}

{ TAvailabilityForm }

procedure TAvailabilityForm.FindButtonClick(Sender: TObject);
   var curProduct: TProduct;
     dell: integer;
begin
   product.name :=  Edit1.Text;
   product.country := Edit2.Text;
   dell := 0;
   if Filesize(f)=0 then Rewrite(f);
   while not (EOF(f)) do
   begin
        read(f, curProduct);
        if (curProduct.name = product.name) and (curProduct.country = product.country) then dell := 1;
   end;
   if dell = 1 then MessageDlg('Yes, are available', mtConfirmation, mbYesNoCancel,0);
   if dell = 0 then MessageDlg('No, are not available', mtConfirmation, mbYesNoCancel,0);
end;

procedure TAvailabilityForm.BackButClick(Sender: TObject);
begin
     AvailabilityForm.Hide();
      StartForm.Show();
end;


end.

