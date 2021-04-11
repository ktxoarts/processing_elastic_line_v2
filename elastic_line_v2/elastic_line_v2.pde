ArrayList<ElasticLine> all_lines; //<>//
int stroke_color=0;
int stroke_weight=4;
void setup() {
  size(800, 600);
  all_lines = new ArrayList<ElasticLine>();
}


void draw() {
  background(122); 
  for (ElasticLine l : all_lines) {
    l.display();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    all_lines.add(new ElasticLine(mouseX, mouseY, 10, 0.01, 0,stroke_weight,stroke_color));
  } else if (mouseButton == RIGHT) {
    all_lines.removeAll(all_lines);
  }
}

void keyPressed() {
  if (key == 'r'){
    stroke_color= color(random(1,255),random(1,255),random(1,255));
  }else if (key == 'w'){
     stroke_color= color(255, 255, 255);
  }else if (key == 'b'){
     stroke_color= color(0, 0, 0);
  }else if (key == 'g'){
     stroke_color= color(random(0,255));
  }  

}
