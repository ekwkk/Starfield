Particle [] newParticle = new Particle[100];


void setup()
{
	size(600,600);
	
	for (int i = 0; i < newParticle.length; i++)
	{
		newParticle[i] = new NormalParticle();
	}
	newParticle[0] = new OddballParticle();
	newParticle[1] = new JumboParticle();
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
	double myX, myY, speed;
	int theta;

	NormalParticle()
	{
		myX = 300;
		myY = 300;
		speed = Math.random()*1+4;
		theta = (int)(Math.random()*4);
	}

	public void move()
	{
		myX += Math.cos(theta) * speed;
		myY += Math.sin(theta) * speed;
        System.out.println(frameCount);
		if (frameCount%100 == 0)
		{
			myX = 300;
			myY = 300;
		}
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
		myX += Math.random()*5;
		myY += Math.random()*5;	
	}
}






class JumboParticle extends NormalParticle
{
	public void show()
	{
		noStroke();
		fill(120,120,220);
		ellipse((float)myX, (float)myY, 50, 50);
	}
}

