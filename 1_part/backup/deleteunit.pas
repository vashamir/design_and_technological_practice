unit DeleteUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, AddUnit;

type

   {TDeleteForm}

  TDeleteForm = class(TForm)
     BackButton: TButton;
     DeleteB: TButton;
     Edit1: TEdit;
     Edit2: TEdit;
     Edit3: TEdit;
     Edit4: TEdit;
     Label1: TLabel;
     Label2: TLabel;
     Label3: TLabel;
     Label4: TLabel;
     procedure BackButtonClick(Sender: TObject);
     procedure DeleteBClick(Sender: TObject);

   private

   public

     end;


var
  DeleteForm: TDeleteForm;

implementation

uses StartUnit;

{$R *.lfm}

{ TDeleteForm }

procedure TDeleteForm.DeleteBClick(Sender: TObject);
var delNumber, del : integer;
    delProduct, currentProduct : TProduct;
begin
    product.name := Edit1.Text;
    product.date := StrToDate(Edit2.Text);
    product.count := StrToInt(Edit3.Text);
    product.country := Edit4.Text;
    Reset(f);
    if Filesize(f)=0 then Rewrite(f);
    i:=1;
    del := 0;
    while not (EOF(f)) do
    begin
         read(f, currentProduct);
         if(currentProduct.name = product.name) and (currentProduct.date = product.date)and (currentProduct.country = product.country) then begin
            if(currentProduct.count < product.count) then begin
               MessageDlg('Not enough goods in stock', mtConfirmation, mbYesNoCancel,0);
            end;
            if(currentProduct.count > product.count) then begin
               products[i].count := products[i].count - product.count;
            end;
            if(currentProduct.count = product.count) then begin
                del := 1;
                delNumber := i;
                delProduct := currentProduct;
            end;
         end;
         i:= i + 1;
    end;
    reset(f);
    while del = 1 do
    begin
         read(f, currentProduct);
         if (currentProduct.name = delProduct.name) and (currentProduct.date = delProduct.date)and (currentProduct.country = delProduct.country) and(currentProduct.count = delProduct.count) then begin
            del := 0;
            for i:= delNumber to pNumber-1 do
            begin
                 products[i]:=products[i+1];
            end;
            pNumber := pNumber - 1;
         end;
    end;
    AddForm.WriteProductsToFile();
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit1.SetFocus;
end;

procedure TDeleteForm.BackButtonClick(Sender: TObject);
begin
      DeleteForm.Hide();
      StartForm.Show();
end;

end.

