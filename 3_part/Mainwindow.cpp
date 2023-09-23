#include "mainwindow.h"
#include "addform.h"
#include "deleteform.h"
MainWindow::MainWindow(QWidget *parent)
: QMainWindow(parent)
, ui(new Ui::MainWindow)
{
ui->setupUi(this);
}
MainWindow::~MainWindow()
{
delete ui;
}
void MainWindow::on_AddButton_clicked()
{
addform.show();
}
void MainWindow::on_DeleteButton_clicked()
{
deleteform.show();
}
void MainWindow::on_AvailabilityButton_clicked()
{
availabilityform.show();
}
void MainWindow::on_AmountButton_clicked()
{
amountform.show();
}
void MainWindow::on_PeriodButton_clicked()
{
periodform.show();
}
void MainWindow::on_GraphButton_clicked()
{
graphform.show();
}
