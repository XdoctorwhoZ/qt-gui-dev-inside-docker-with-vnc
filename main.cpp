#include <QApplication>
#include <QPushButton>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
  
    QPushButton button ("Hello world From Container !!!!!");
    button.show();

    QPushButton button_2 ("New button !");
    button_2.show();

    app.exec();

    return 0;
}