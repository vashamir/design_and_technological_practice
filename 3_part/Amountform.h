#ifndef AMOUNTFORM_H
#define AMOUNTFORM_H
#include <QDialog>
namespace Ui {
class AmountForm;
}
class AmountForm : public QDialog
{
Q_OBJECT
public:
explicit AmountForm(QWidget *parent = nullptr);
~AmountForm();
private slots:
void on_pushButton_clicked();
void on_pushButton_2_clicked();
private:
Ui::AmountForm *ui;
};
#endif // AMOUNTFORM_H
