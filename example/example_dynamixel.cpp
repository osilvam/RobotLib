#ifndef PRUEBA_CPP
#define PRUEBA_CPP

#include "example.hpp"

int main(int argc, char* argv[])
{	
	USB2Dynamixel dynamixel(argv[1],1);
	Joint * joint = new Joint((char*)"DEG");

	dynamixel.addMotor(joint,1);

	while(1)
	{
		double position;
		cout << "Ingrese un valor para el angulo del motor en DEG ó 999 para terminar:" << endl;
		cin >> position;

		if(position == 999) break;
		else
		{	
			clog << "moving to position: " << position << endl;
			joint->setJointNextPosition(position);
			dynamixel.move();
			sleep(2);
		} 
	}
	
	delete(joint);

	return(0);
}

#endif
