Particle [] newParticle = new Particle[100];
Particle [] anotherParticle = new Particle[100];


void setup()
{
	size(600,600);
	
	for (int i = 0; i < newParticle.length; i++)
	{
		newParticle[i] = new NormalParticle();
	}
	newParticle[0] = new OddballParticle();
	newParticle[1] = new JumboParticle();


	for (int i = 0; i < anotherParticle.length; i++)
	{
		anotherParticle[i] = new WeirdParticle(300,300);
	}

}




void draw()
{
	background(0);
	for (int i = 0; i < newParticle.length; i++)
	{
		newParticle[i].show();
		newParticle[i].move();
	}

	for (int i = 0; i < anotherParticle.length; i++)
	{
		anotherParticle[i].show();
		anotherParticle[i].move();
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
		speed = (Math.random()*1+4);
		theta = (Math.random()*7);
	}


	public void move()
	{
		myX += Math.cos(theta) * speed;
		myY += Math.sin(theta) * speed;
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
		ellipse((float)myX, (float)myY, 20, 20);
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
	float diameter, d2; 
	float angle = 0;

	OddballParticle() 
	{
		myX = 0;
		myY = 500;
	}

	public void show() 
	{
		noStroke();
		diameter = (float)myY - 500;
  		fill(255, 204, 0);
  		ellipse((float)myX/2, (float)myY/2, d2, d2);
	}

	public void move() 
	{
		d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
 		angle += 0.05;
 		myX += 2;
 		if (frameCount%600 == 0)
		{
			myX = 0;
			myY = 500;
		}
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



class WeirdParticle extends NormalParticle
{
	int myX, myY;

	WeirdParticle(int x, int y)
	{
		myX = x;
		myY = y;
		myColor = color(255);
	}


	public void show()
	{
		noStroke();
		fill(myColor);
		ellipse(myX, myY, 10, 10);
	}


	public void move()
	{
		myX += (int)(Math.cos(theta) * speed);
		myY += (int)(Math.sin(theta) * speed);
		if (frameCount%75 == 0)
		{
			myX = 300;
			myY = 300;
		}
	}
}
