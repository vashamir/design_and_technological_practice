#include "availabilityform.h"
#include "ui_availabilityform.h"
#include <QString>
#include <QDate>
#include "mainwindow.h"
#include "bookfile.h"
#include <bits/stdc++.h>
#include <QMessageBox>
AvailabilityForm::AvailabilityForm(QWidget *parent) :
QDialog(parent),
ui(new Ui::AvailabilityForm)
{
ui->setupUi(this);
}
AvailabilityForm::~AvailabilityForm()
{
delete ui;
}
void AvailabilityForm::on_pushButton_2_clicked()
{
this->close();
}
void AvailabilityForm::on_pushButton_clicked()
{
bookFile book;
QString nn, cc;
nn = ui->lineEdit->text();
cc = ui->lineEdit_2->text();
ui->lineEdit->clear();
ui->lineEdit_2->clear();
if(book.findProduct(nn, cc))
{
QMessageBox msgBox(QMessageBox::Information,
"In stock",
"Yes, in stock",
QMessageBox::Ok);
msgBox.exec();
}
else{
QMessageBox msgBox(QMessageBox::Information,
"Not available",
"No, not available",
QMessageBox::Ok);
msgBox.exec();
}
}
