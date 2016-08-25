#include "example.hpp"

int main(int argc, char* argv[])
{	
	RobotVREP vrep(false);

	Joint * joint = new Joint((char*)"DEG",(char*)"joint");
	CollisionObject * cylinder = new CollisionObject((char*)"Collision");

	vrep.addJoint(joint);
	vrep.addCollisionObject(cylinder);

	double vel = 0.0;
	int notCollision = 0;
	
	vrep.startSimulation(simx_opmode_oneshot_wait);

	while (notCollision < 2)
	{	
		notCollision = (vrep.readCollision(cylinder)) ? 0 : notCollision + 1; 

		vel = vel + 0.2;
		vrep.setJointTargetVelocity(joint, vel);
		cout << "Joint Velocity:\t" << vel << endl;

		usleep(500000);			
	}

	while (vel >= 0.2)
	{
		vel = vel - 0.2;
		vrep.setJointTargetVelocity(joint, vel);
		cout << "Joint Velocity:\t" << vel << endl;
		
		usleep(500000);	
	}	

	vrep.stopSimulation(simx_opmode_oneshot_wait);	

	delete(joint);
	delete(cylinder);
	
	return(0);
}