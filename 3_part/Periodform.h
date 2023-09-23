#ifndef PERIODFORM_H
#define PERIODFORM_H
#include <QDialog>
namespace Ui {
class PeriodForm;
}
class PeriodForm : public QDialog
{
Q_OBJECT
public:
explicit PeriodForm(QWidget *parent = nullptr);
~PeriodForm();
private slots:
void on_pushButton_2_clicked();
void on_pushButton_clicked();
private:
Ui::PeriodForm *ui;
};
#endif // PERIODFORM_H
