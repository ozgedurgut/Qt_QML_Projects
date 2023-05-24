#include "back.h"

Back::Back(QObject *parent) : QObject(parent){

}

void Back::changeValue(int a){

    if(a == 1){
        valueChanged("value is 1, From C++");
    }
    else if(a == 2){
        valueChanged("value is 2, From C++");
    }
    else{
        valueChanged("!!!!!!!!!");
    }
}
