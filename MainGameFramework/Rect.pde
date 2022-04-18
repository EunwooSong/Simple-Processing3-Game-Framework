class Rect {
  Rect(Entity e) {
    parent = e;
    w = 0; h = 0;
  }
  Entity parent;
  public float left;
  public float right;
  public float top;
  public float bottom;
  public float w;
  public float h;
  
  void Update() {
    left = parent.pos.x - w * parent.center.x  * parent.scale.x;
    top = parent.pos.y - h * parent.center.y * parent.scale.y;
    right = parent.pos.x + w * (1f - parent.center.x) * parent.scale.x;
    bottom = parent.pos.y + h  * (1f - parent.center.y) * parent.scale.y;
  }
  
  void Print() {
    if(debugMode == 1) {
      stroke(10);
      fill(#FFFFFF, 0);
      rect(left, top, right-left, bottom-top);
      noStroke();
    }
  }
  
  void setWidthAndHeight(float w, float h) {
    this.w = w;
    this.h = h;
  }
  PVector center() {
    return new PVector(w / 2.0f, h / 2.0f);
  }
  int Interaction(Rect r) {
    Update();
    r.Update();
    if(r.right > left && r.left < right)
      if(r.bottom > top && r.top < bottom)
          return 1;
    
    return 0;
  }
}
