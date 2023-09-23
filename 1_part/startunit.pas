unit StartUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, AddUnit, DeleteUnit, AvailabilityUnit, AmountUnit, PeriodUnit, GraphUnit;

type

  { TStartForm }

  TStartForm = class(TForm)
    AddButton: TButton;
    AvailabilityButton: TButton;
    AmountButton: TButton;
    Button1: TButton;
    GraphButton: TButton;
    PeriodButton: TButton;
    DeleteButton: TButton;
    procedure AddButtonClick(Sender: TObject);
    procedure AmountButtonClick(Sender: TObject);
    procedure AvailabilityButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GraphButtonClick(Sender: TObject);
    procedure PeriodButtonClick(Sender: TObject);
    procedure ReadProductsFromFile();

  private

  public

  end;

   TProduct = record
    name : shortstring;
    date : TDateTime;
    count: integer;
    country : shortstring;
  end;

  TProducts = array[1..100] of TProduct;

var
  StartForm: TStartForm;
  f: file of TProduct;
  product: TProduct;
  products: TProducts;
  pNumber:word;
  i:integer;
  ccproduct: TProduct;
  ccproducts: TProducts;
  ppNumber: word;
  maxcount, mincount : integer;
  maxdate, mindate : TDateTime;

implementation

{$R *.lfm}

{ TStartForm }


procedure TStartForm.AddButtonClick(Sender: TObject);
begin
       AddForm.Show;
       AddForm.Edit1.Setfocus
end;

procedure TStartForm.ReadProductsFromFile();
begin
     Reset(f);
  if Filesize(f)=0 then Rewrite(f);
  i:=1;
  while not (EOF(f)) do
  begin
    read(f, products[i]);
    i:= i + 1;
  end;
  pNumber:=i-1;
  CloseFile(f);
end;

procedure TStartForm.AmountButtonClick(Sender: TObject);
begin
      AmountForm.Show;
end;

procedure TStartForm.AvailabilityButtonClick(Sender: TObject);
begin
       AvailabilityForm.Show;
       AvailabilityForm.Edit1.Setfocus
end;

procedure TStartForm.Button1Click(Sender: TObject);
begin
       Close();
end;

procedure TStartForm.DeleteButtonClick(Sender: TObject);
begin
       DeleteForm.Show;
       DeleteForm.Edit1.Setfocus
end;

procedure TStartForm.FormCreate(Sender: TObject);
begin
  Assignfile(f, 'products.txt');
end;

procedure TStartForm.FormShow(Sender: TObject);
begin
  StartForm.ReadProductsFromFile();
end;

procedure TStartForm.GraphButtonClick(Sender: TObject);
begin
    GraphForm.Show;
    GraphForm.Edit1.Setfocus
end;

procedure TStartForm.PeriodButtonClick(Sender: TObject);
begin
    PeriodForm.Show;
    PeriodForm.Edit1.Setfocus
end;

end.

