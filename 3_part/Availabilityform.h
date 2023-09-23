#ifndef AVAILABILITYFORM_H
#define AVAILABILITYFORM_H
#include <QDialog>
namespace Ui {
class AvailabilityForm;
}
class AvailabilityForm : public QDialog
{
Q_OBJECT
public:
explicit AvailabilityForm(QWidget *parent = nullptr);
~AvailabilityForm();
private slots:
void on_pushButton_2_clicked();
void on_pushButton_clicked();
private:
Ui::AvailabilityForm *ui;
};
#endif // AVAILABILITYFORM_H
