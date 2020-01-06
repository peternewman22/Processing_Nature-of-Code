class SquareParticle extends Particle{

   SquareParticle(PVector l){
     super(l);
   }
   
   void display(){
     rectMode(CENTER);
     rect(loc.x, loc.y, 16, 16);
   }
}
