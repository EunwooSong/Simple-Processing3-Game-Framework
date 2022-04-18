class Test extends Entity {
  Test() {print("test");}
  public void Start() {
      AddChild(new Test());
  }
  public void Update() {
    super.Update();
  }
}

class MainScene extends Scene {
  SpriteRenderer img_background;
  SpriteRenderer img_logo;
  
  float time;
  
  MainScene() {
    super();
    img_background = new SpriteRenderer();
    img_logo = new SpriteRenderer();
    img_background.setRenderer(loadImage("./Resources/Simple Player.png"));
    img_background.setPos(new PVector(0, 0));
    img_background.setScale(0.1f, 0.1f);
    img_logo.setRenderer(loadImage("./Resources/Simple Player.png"));
    img_logo.setScale(0.1f, 0.1f);
    img_logo.setPos(700, 0);
    this.AddChild(img_background);
    this.AddChild(img_logo);
    //time = 0;
  }
  
  void Update() {
    //img_background.Rotate(0.1f);
    img_background.Translate(1, 0);
    super.Update();
  }
  void Render() {
    super.Render();
    
    if(img_background.getRect().Interaction(img_logo.getRect()) == 1) {
      println("Player and Player Interation!");
    }
    
    //rotate(time * 3);
    //translate(-400, -300);
    //image(img_background.getRenderer(), 0, 0);
  }
}
