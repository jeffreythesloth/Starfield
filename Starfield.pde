Particle [] particles;
public void setup()
{
  size(300,300);
  particles = new Particle[300];
  for(int i = 0; i < particles.length; i++)
  {
    particles[i] = new Normal();
  }
  particles[0] = new Oddball();
  particles[1] = new Jumbo();
}
void draw()
{
  background(0);
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].show();
  }
}
class Normal implements Particle
{
  int myColor;
  double dX,dY,dTheta,dSpeed;
  Normal()
  {
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    dX = 150;
    dY = 150;
    dTheta = Math.random()*(2*Math.PI);
    dSpeed = Math.random()*8;
  }
  public void move()
  {
    dX = dX + Math.cos(dTheta)*dSpeed;
    dY = dY + Math.sin(dTheta)*dSpeed;
    if (dX > 300 || dY > 300)
      dX = dY = 150;
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)dX,(float)dY,10,10);
  }
}
class Oddball implements Particle
{
  int myColor;
  double dX,dY,dTheta,dSpeed;
  Oddball()
  {
    myColor = color(255);
    dX = 150;
    dY = 150;
    dTheta = Math.random()*(2*Math.PI);
    dSpeed = Math.random()*5;
  }
  public void move()
  {
    dX = dX + Math.cos(dTheta)*dSpeed;
    dY = dY + Math.sin(dTheta)*dSpeed;
    if (dX > 300 || dY > 300)
      dX = dY = 150;
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    rect((float)dX,(float)dY,10,10);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class Jumbo extends Normal
{
  Jumbo()
  {
  dSpeed = Math.random()*5;
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)dX,(float)dY,30,30);
  }
}