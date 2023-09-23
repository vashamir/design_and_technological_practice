#ifndef ADDFORM_H
#define ADDFORM_H
#include <QDialog>
#include "bookfile.h"
namespace Ui {
class AddForm;
}
class AddForm : public QDialog
{
Q_OBJECT
public:
explicit AddForm(QWidget *parent = nullptr);
~AddForm();
private slots:
void on_pushButton_2_clicked();
void on_pushButton_clicked();
private:
Ui::AddForm *ui;
};
#endif // ADDFORM_H
