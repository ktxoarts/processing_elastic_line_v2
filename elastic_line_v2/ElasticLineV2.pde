//<>// //<>// //<>//
class Constants {
  static final float RIGHT = 1;
  static final float LEFT = -1;
  static final float NONE = 0;
}

class ElasticLine {
  float line_lenght = height/3;
  PVector p1= new PVector(width/2, (height - line_lenght)/2);
  PVector p2= new PVector(width/2, (height + line_lenght)/2);
  PVector p3= new PVector(width/2, height/2);

  int stroke_weight= 5;
  int stroke_color= color(0);
  int proximity = 30;
  float bounce = 0.1;
  float direction = 0;
  float distortion=0;

  ElasticLine(int proximity, float bounce) {
    this.proximity=proximity;
    this.bounce = bounce;
  };
  ElasticLine(float x1, float y1, int proximity, float bounce, float distortion) {
    this(x1, y1, proximity, bounce, distortion, 5, color(0));
  }
  
  ElasticLine(float x1, float y1, int proximity, float bounce, float distortion, int stroke_weight, int stroke_color) {
    p3 = new PVector(x1, y1); 
    p1= new PVector(p3.x, y1 - line_lenght/2);       
    p2 =new PVector(p3.x, y1 + line_lenght/2);
    this.proximity=proximity;
    this.bounce = bounce;
    this.distortion = distortion;
    this.stroke_weight = stroke_weight;
    this.stroke_color= stroke_color;
  }

  void display() {
    if ( mouseX < pmouseX ) {
      direction = Constants.LEFT;
    } else if ( mouseX ==pmouseX ) {
      direction = Constants.NONE;
    } else {
      direction = Constants.RIGHT;
    }
    strokeWeight(stroke_weight);
    stroke(stroke_color);
    if (( abs(mouseX - p1.x) < proximity) && ((mouseY > p1.y && mouseY < p2.y))) {
      p3.x = (1+ direction * bounce) *(p3.x + direction * proximity);
      p3.y = mouseY + this.distortion;
    } else {
      p3.x = p1.x;
    }
    line( p1.x, p1.y, p3.x, p3.y);
    line( p2.x, p2.y, p3.x, p3.y);
  }
  void expand() {
    stroke_weight= (int)random(30, 50);
  }
}
