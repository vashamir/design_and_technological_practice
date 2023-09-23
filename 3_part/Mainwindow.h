#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>
#include "addform.h"
#include "ui_mainwindow.h"
#include "deleteform.h"
#include "availabilityform.h"
#include "amountform.h"
#include "periodform.h"
#include "graphform.h"
#include <QFile>
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE
class MainWindow : public QMainWindow
{
Q_OBJECT
public:
MainWindow(QWidget *parent = nullptr);
~MainWindow();
public slots:
void on_AddButton_clicked();
void on_DeleteButton_clicked();
void on_AvailabilityButton_clicked();
void on_AmountButton_clicked();
void on_PeriodButton_clicked();
void on_GraphButton_clicked();
private:
Ui::MainWindow *ui;
AddForm addform;
DeleteForm deleteform;
AvailabilityForm availabilityform;
AmountForm amountform;
PeriodForm periodform;
GraphForm graphform;
};
#endif // MAINWINDOW_H
