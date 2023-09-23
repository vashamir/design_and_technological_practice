unit GraphUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, AddUnit;

type

  { TGraphForm }

  TGraphForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Image: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  GraphForm: TGraphForm;
  x0,y0,x1,y1,xmin,xmax,ymin,ymax, dx, dy, x, y: integer;
  daymax, daymin, yearmax, yearmin, monthmax, monthmin, yearc, monthc, dayc: word;


implementation

uses StartUnit;

{$R *.lfm}

{ TGraphForm }

procedure TGraphForm.Button1Click(Sender: TObject);
begin
      GraphForm.Hide();
      StartForm.Show();
end;

procedure TGraphForm.Button2Click(Sender: TObject);
begin
   ppNumber := 0;
   maxcount:= 0;
   mincount:= 9999999;
   maxdate:=StrToDate('30.12.2000');
   mindate:=StrToDate('30.12.2222');
   product.name := Edit1.Text;
   Reset(f);
    while not (EOF(f)) do
    begin
         read(f, ccproduct);
         if(ccProduct.name = product.name) then begin
            ppNumber := ppNumber + 1;
            ccproducts[ppNumber] := ccproduct;
            if(ccproduct.date < mindate) then mindate:=ccproduct.date;
            if(ccproduct.date > maxdate) then maxdate:=ccproduct.date;
            if(ccproduct.count < mincount) then mincount:=ccproduct.count;
            if(ccproduct.count > maxcount) then maxcount:=ccproduct.count;
         end;
    end;
    if(ppNumber < 2) then begin
       MessageDlg('Not enough incomes!',mtConfirmation,mbYesNoCancel,0);
    exit();
    end;
    x0:=Image.Width div 10;
  x1:=Image.Width div 10*9;
  xmin:=Image.Width div 10*2;
  xmax:=Image.Width div 10*8;
  y0:=Image.Height*9 div 10;
  y1:=Image.Height div 10;
  ymin:=Image.Height*8 div 10;
  ymax:=Image.Height*2 div 10;
  DecodeDate(maxdate, yearmax, monthmax, daymax);
  DecodeDate(mindate, yearmin, monthmin, daymin);
  dx:= (xmax - xmin) div (((((yearmax-1)*12)+monthmax-1)*30+daymax) - ((((yearmin-1)*12)+monthmin-1)*30+daymin));
  dy:= (ymin - ymax) div (maxcount - mincount);

  Image.Canvas.Pen.Color:=clBlack;
  Image.Canvas.MoveTo(x0,y0);
  Image.Canvas.LineTo(x0,y1);
  Image.Canvas.MoveTo(x0,y0);
  Image.Canvas.LineTo(x1,y0);
  Image.Canvas.TextOut(x0,y1,'amount');
  Image.Canvas.TextOut(x1,y0,'date');
  for i:=1 to ppNumber do begin
       ccproduct := ccproducts[i];
       DecodeDate(ccproduct.date, yearc, monthc, dayc);
       x:= dx*(((((yearc-1)*12)+monthc-1)*30+dayc) - ((((yearmin-1)*12)+monthmin-1)*30+daymin));
       y:= dy*(ccproducts[i].count - mincount);
       if(i > 1) then Image.Canvas.LineTo(x + xmin ,ymin - y);
       Image.Canvas.MoveTo(x + xmin, ymin - y);
       Image.Canvas.Brush.Color:=clBlack;
       Image.Canvas.Ellipse(x + xmin -3,ymin - y -3,x +xmin +3,ymin - y +3);
       Image.Canvas.Brush.Color:=clWhite;
       Image.Canvas.TextOut(x + xmin - Image.Canvas.TextWidth(DateToStr(ccproduct.date)) div 2, y0 + Image.Canvas.TextHeight(DateToStr(ccproduct.date)) div 2, DateToStr(ccproduct.date));
       Image.Canvas.TextOut(x0 - Image.Canvas.TextWidth(IntToStr(ccproduct.count))*2, ymin - y - Image.Canvas.TextHeight(DateToStr(ccproduct.date)) div 2, IntToStr(ccproduct.count));
       Image.Canvas.MoveTo(x + xmin, ymin - y);
  end;

end;

procedure TGraphForm.FormActivate(Sender: TObject);
begin
  Image.Canvas.Brush.Color:=clWhite;
  Image.Canvas.FillRect(0,0,Width,Height);
end;

procedure TGraphForm.FormShow(Sender: TObject);
begin

end;


end.

