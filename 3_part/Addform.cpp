#include "addform.h"
#include "ui_addform.h"
#include <QString>
#include <QDate>
#include "mainwindow.h"
#include "bookfile.h"
#include <bits/stdc++.h>
AddForm::AddForm(QWidget *parent) :
QDialog(parent),
ui(new Ui::AddForm)
{
ui->setupUi(this);
}
AddForm::~AddForm()
{
delete ui;
}
void AddForm::on_pushButton_2_clicked()
{
this->close();
}
void AddForm::on_pushButton_clicked()
{
bookFile book;
productType pr;
pr.name = ui->lineEdit->text();
pr.date = QDate::fromString(ui->lineEdit_2->text(), "dd.MM.yyyy");
QString s;
s = ui->lineEdit_3->text();
pr.amount = s.toInt();
pr.country = ui->lineEdit_4->text();
book.addProduct(pr);
ui->lineEdit->clear();
ui->lineEdit_2->clear();
ui->lineEdit_3->clear();
ui->lineEdit_4->clear();
}
