#include "deleteform.h"
#include "ui_deleteform.h"
#include <QString>
#include <QDate>
#include "mainwindow.h"
#include "bookfile.h"
#include <bits/stdc++.h>
DeleteForm::DeleteForm(QWidget *parent) :
QDialog(parent),
ui(new Ui::DeleteForm)
{
ui->setupUi(this);
}
DeleteForm::~DeleteForm()
{
delete ui;
}
void DeleteForm::on_pushButton_2_clicked()
{
this->close();
}
void DeleteForm::on_pushButton_clicked()
{
bookFile book;
productType pr;
pr.name = ui->lineEdit->text();
pr.date = QDate::fromString(ui->lineEdit_2->text(), "dd.MM.yyyy");
QString s;
s = ui->lineEdit_3->text();
pr.amount = s.toInt();
pr.country = ui->lineEdit_4->text();
book.deleteProduct(pr);
ui->lineEdit->clear();
ui->lineEdit_2->clear();
ui->lineEdit_3->clear();
ui->lineEdit_4->clear();
}
