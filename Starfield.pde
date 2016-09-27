Particle [] newParticle = new Particle[100];


void setup()
{
	size(600,600);
	
	for (int i = 0; i < newParticle.length; i++)
	{
		newParticle[i] = new NormalParticle();
	}
	newParticle[0] = new OddballParticle();
}




void draw()
{
	background(255);
	for (int i = 0; i < newParticle.length; i++)
	{
		newParticle[i].show();
		newParticle[i].move();
	}
}




class NormalParticle implements Particle
{
	int myColor = color((int)(Math.random()*180), 250 ,(int)(Math.random()*180));
	double myX, myY, speed, theta;

	NormalParticle()
	{
		myX = 300;
		myY = 300;
		speed = Math.random()*3+5;
		theta = Math.random()*4;
	}

	public void move()
	{
		myX += Math.cos(theta) * speed;
		myY += Math.sin(theta) * speed;
	}

	public void show()
	{
		noStroke();
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}




interface Particle
{
	public void show();
	public void move();
}





class OddballParticle implements Particle
{
	double myX, myY;

	OddballParticle() 
	{
		myX = 300;
		myY = 300;
	}

	public void show() 
	{
		noStroke();
		fill(0);
		rect((float)myX, (float)myY, 20, 20);	
	}

	public void move() 
	{
		myX += Math.random()*10-5;
		myY += Math.random()*10-5;	
	}
}






class JumboParticle extends NormalParticle
{
	//your code here
}

