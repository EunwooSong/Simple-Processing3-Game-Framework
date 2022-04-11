class Entity {
  PVector pos;
  float rotation;
  String tag;
  PImage renderer;
  Rect rect;
  Entity parent;
  ArrayList<Entity> children;
  
  Entity() { pos = new PVector(0, 0); rotation = 0; tag = ""; renderer = null; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this); }
  Entity(float rot) { pos = new PVector(0, 0); rotation = rot; tag = ""; renderer = null; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this);}
  Entity(float x, float y) {pos = new PVector(x, y);  rotation = 0; tag = ""; renderer = null; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this);}
  Entity(float x, float y, float rot) {pos = new PVector(x, y);  rotation = rot; tag = ""; renderer = null; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this);}

  public void setPos(PVector p) { pos = p; }
  public void setRotation(float r) { rotation = r; }
  public void setTag(String t) { tag = t; }
  public void setRenderer(PImage render) { renderer = render; }
  public PVector getPos() {return pos;}
  public float getRotation() {return rotation;}
  public String getTag() {return tag;}
  public PImage getRenderer() {return renderer; }
  
  public void Translate(PVector p) {pos.add(p);}
  public void Rotation(float f) {rotation += f;}
  public void Update() {
  }
  public void Render() {
    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(rotation);
    if(renderer != null)
      image(renderer, 0, 0);
    
    for(Entity child : children) {
      child.Render();
    }
    
    popMatrix();
  } 
  
  public void AddChild(Entity child) {
    child.parent = this;
    children.add(child);
  }
}

class Scene extends Entity {
  color backgroundColor;
  Scene() { super(); backgroundColor = #FFFFFF;}
  
  public void Update() {
    super.Update();
    for(Entity chlid : children)
      chlid.Update();
    
  }
  public void setBackgroundColor(color c) {
    backgroundColor = c;
  };
  public color getBackgroundColor() { return backgroundColor; }
  
  public void Render() {
    background(backgroundColor);
    super.Render();
  }
}

class Rect {
  Rect(Entity e) {
    parent = e;
  }
  Entity parent;
  float left;
  float right;
  float top;
  float bottom;
  float w;
  float h;
  
  void Update() {
    left = parent.pos.x;
    top = parent.pos.y;
    right = parent.pos.x + w;
    bottom = parent.pos.y + h;
    
  }
  
  void setWidthAndHeight(float w, float h) {
    this.w = w;
    this.h = h;
  }
  PVector center() {
    return new PVector(w / 2.0f, h / 2.0f);
  }
  int Interaction(Rect r) {
    if(r.left + r.w > left && this.right < r.left)
      if(r.top + r.h > bottom && bottom > r.bottom)
          return 1;
    
    return 0;
  }
}

class MainFramework {
  MainFramework() {screenX = width; screenY = height; currentScene = null;}
  
  void Update() {
    if(currentScene != null) {
      currentScene.Update();
    }
  }
  void Render() {
    if(currentScene != null) {
      currentScene.Render();
    }
  }
  void ChangeScene(Scene scene) {
     currentScene = scene; 
  }
  
  public int screenX;
  public int screenY;
  
  public Scene currentScene;
}
