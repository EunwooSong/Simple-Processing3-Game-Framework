class Sprite extends Entity {
  protected PImage renderer;
  public Rect renderRect;
  
  Sprite(Entity parent) { super(); rotation = 0; renderer = null; renderRect = new Rect(parent); }
  Sprite(Entity parent, PImage img) { super();  setRenderer(img); rotation = 0; renderRect = new Rect(parent); }
 
  public PVector getCenter() {
    return center;
  }
  
  public void setRenderer(PImage img) {
    renderer = img;
    renderRect.w = img.width;
    renderRect.h = img.height;
  }
  
  public void Render() {
    pushMatrix();
    translate(renderRect.w * center.x * scale.x, renderRect.h * center.y * scale.y);
    rotate(rotation);
    translate(-renderRect.w * center.x * scale.x, -renderRect.h * center.y * scale.y);
    
    image(renderer, 0, 0, renderRect.w * scale.x, renderRect.h * scale.y);
    
    popMatrix();
  } 
}

class SpriteRenderer extends Entity {
  Sprite sprite;
  SpriteRenderer() {
    super();
    sprite = new Sprite(this);
    AddChild(sprite);
  }
  
  public void Update() {
    rect.w = sprite.renderRect.w;
    rect.h = sprite.renderRect.h;
    super.Update();
  }
  
  public void setScale(float x, float y) { super.setScale(x, y); sprite.setScale(x, y); }
  public void setScale(PVector scale) { super.setScale(scale); sprite.setScale(scale); }
  
  float getRotation() {
    return sprite.rotation;
  }
  void setRotation(float angle) {
    sprite.rotation = angle;
  }
  Sprite getSprite() {
    return sprite;
  }
  void Rotate(float angle) {
    sprite.rotation += angle;
  }
  
  void setRenderer(PImage img) {
    sprite.setRenderer(img);
  }
}
