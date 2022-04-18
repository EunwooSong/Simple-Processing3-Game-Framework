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
