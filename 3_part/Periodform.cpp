#include "periodform.h"
#include "ui_periodform.h"
#include <QString>
#include <QDate>
#include "mainwindow.h"
#include "bookfile.h"
#include <bits/stdc++.h>
#include <QTabWidget>
PeriodForm::PeriodForm(QWidget *parent) :
QDialog(parent),
ui(new Ui::PeriodForm)
{
ui->setupUi(this);
}
PeriodForm::~PeriodForm()
{
delete ui;
}
void PeriodForm::on_pushButton_2_clicked()
{
this->close();
}
void PeriodForm::on_pushButton_clicked()
{
struct productType
{
QString name, country;
int amount;
QDate date;
};
QFile *f;
productType products[100];
int pNumber;
productType product;
f = new QFile("f.txt");
f->open(QFile::ReadWrite);
pNumber = 0;
int i = 1;
f->seek(0);
QDataStream in(f);
while(!in.atEnd())
{
in>>product.name>>product.date>>product.amount>>product.country;
products[i].name = product.name;
products[i].date = product.date;
products[i].amount = product.amount;
products[i].country = product.country;
i++;
}
pNumber = i - 1;
int lnum = 0;
for(int i = 1; i <= pNumber; ++i)
{
if((products[i].date > QDate::fromString(ui->lineEdit->text(), "dd.MM.yyyy"))
&& (products[i].date < QDate::fromString(ui->lineEdit_2->text(), "dd.MM.yyyy")))
{
QTableWidgetItem *item; // элемент таблицы
item = new QTableWidgetItem(); // создаем элемент
item->setFlags(Qt::NoItemFlags);//запрещаем
// выделение
item->setText(products[i].date.toString("dd.MM.yyyy")); // записываем текст
ui->tableWidget->setItem(lnum,0,item);
// к
таблице
item = new QTableWidgetItem();// создаем элемент
item->setFlags(Qt::NoItemFlags); //запрещаем
// выделение
item->setText(products[i].name);
ui->tableWidget->setItem(lnum,1,item);
item = new QTableWidgetItem();// создаем элемент
item->setFlags(Qt::NoItemFlags); //запрещаем
// выделение
item->setText(products[i].country);
ui->tableWidget->setItem(lnum,2,item);
lnum++;
}
}
}
