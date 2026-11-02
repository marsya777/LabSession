public class Fan {
    //declare variables 
    final int PERLAHAN =1;
    final int SEDERHANA =2;
    final int LAJU=3;

    private int speed=PERLAHAN;
    private boolean on=false;
    private double radius=5;
    String colour="biru";

    //constructor
    public Fan (int speed,boolean on,double radius,String colour){
        this.speed=speed;
        this.on=on;
        this.radius=radius;
        this.colour=colour;
    }

    //getter 
    public int getSpeed(){
        return speed;
    }
    public boolean getOn(){
        return on;
    }
    public double getRadius(){
        return radius;
    }
    public String getColour(){
        return colour;
    }

    //setter 
    public void setSpeed(int newSpeed){
        speed=newSpeed;
    }
    public void setOn(boolean newOn){
        on=newOn;
    }
    public void setRadius(double newRadius){
        radius=newRadius;
    }
    public void setColour(String newColour){
        colour=newColour;
    }

    //method to display statements
    public String toString(){
        String message;
        if(on==true){
            message="Speed : "+speed+"\nColour : "+colour+"\nRadius : "+radius+
            "\n-----------------------";
        }
        else{
            message = "Colour : "+colour+ "\nRadius : "+radius+"\nFan is off.";
        }
        return message;
    }
}