#ifndef DELETEFORM_H
#define DELETEFORM_H
#include <QDialog>
namespace Ui {
class DeleteForm;
}
class DeleteForm : public QDialog
{
Q_OBJECT
public:
explicit DeleteForm(QWidget *parent = nullptr);
~DeleteForm();
public slots:
void on_pushButton_2_clicked();
void on_pushButton_clicked();
private:
Ui::DeleteForm *ui;
};
#endif // DELETEFORM_H
