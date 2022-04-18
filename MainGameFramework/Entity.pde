class Entity {
  protected PVector pos;
  protected PVector scale;
  protected float rotation;
  protected String tag;
  protected Rect rect;
  protected Entity parent;
  public PVector center;
  protected ArrayList<Entity> children;
  
  Entity() { pos = new PVector(0, 0); rotation = 0; tag = ""; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this); scale = new PVector(1.0f, 1.0f); center = new PVector(0.0f, 0.0f); }
  Entity(float rot) { pos = new PVector(0, 0); rotation = rot; tag = ""; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this); scale = new PVector(1.0f, 1.0f); center = new PVector(0.0f, 0.0f); }
  Entity(float x, float y) {pos = new PVector(x, y);  rotation = 0; tag = ""; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this); scale = new PVector(1.0f, 1.0f); center = new PVector(0.0f, 0.0f); }
  Entity(float x, float y, float rot) {pos = new PVector(x, y);  rotation = rot; tag = ""; children = new ArrayList<Entity>(); parent = null; rect = new Rect(this); scale = new PVector(1.0f, 1.0f); center = new PVector(0.0f, 0.0f); }

  public void setPos(PVector p) { pos = p; }
  public void setPos(float x, float y) {pos.x = x; pos.y = y;}
  public void setRotation(float r) { rotation = r; }
  public void setTag(String t) { tag = t; }
  public void setCenter(float x, float y) { center.x = constrain(x, 0f, 1f); center.y = constrain(y, 0f, 1f); }
  public void setCenter(PVector center) { setCenter(center.x, center.y); }
  public void setScale(float x, float y) { scale.x = x; scale.y = y; }
  public void setScale(PVector scale) { this.scale = scale; }
  
  public PVector getPos() {return pos;}
  public float getRotation() {return rotation;}
  public String getTag() {return tag;}
  public Rect getRect() {return rect;}
  public PVector getCenter() {return center;}
  
  public void Translate(PVector p) {pos.add(p);}
  public void Translate(float px, float py) { pos.x += px; pos.y += py;}
  public void Rotate(float f) {rotation += f;}
  public void Update() {
    rect.Update();
  }
  public void Render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation);
    
    for(Entity child : children) {
      child.Render();
    }
    
    popMatrix();
    
    if(debugMode == 1)
      rect.Print();
  } 
  
  public void AddChild(Entity child) {
    child.parent = this;
    children.add(child);
  }
}
