#include "amountform.h"
#include "ui_amountform.h"
#include <QString>
#include <QDate>
#include "mainwindow.h"
#include "bookfile.h"
#include <bits/stdc++.h>
#include <QTabWidget>
AmountForm::AmountForm(QWidget *parent) :
QDialog(parent),
ui(new Ui::AmountForm)
{
ui->setupUi(this);
}
AmountForm::~AmountForm()
{
delete ui;
}
void AmountForm::on_pushButton_clicked()
{
this->close();
}
void AmountForm::on_pushButton_2_clicked()
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
for(int i = 1; i <= pNumber; ++i)
{
QTableWidgetItem *item; // элемент таблицы
item = new QTableWidgetItem(); // создаем элемент
item->setFlags(Qt::NoItemFlags);//запрещаем
// выделение
item->setText(products[i].name); // записываем текст
ui->tableWidget->setItem(i-1,0,item);
// к
таблице
item = new QTableWidgetItem();// создаем элемент
item->setFlags(Qt::NoItemFlags); //запрещаем
// выделение
item->setText(QString::number(products[i].amount));
ui->tableWidget->setItem(i-1,1,item);
}
}
