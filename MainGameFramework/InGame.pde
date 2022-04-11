MainFramework myGame;

class Test extends Entity {
  Test() {print("test");}
  public void Start() {
      AddChild(new Test());
  }
  public void Update() {
    super.Update();
  }
}

void settings() {
  size(800, 600);
}

void setup() {
  myGame = new MainFramework();
  
  Scene tmp = new Scene();
  tmp.AddChild(new Test());
  
  myGame.ChangeScene(tmp);
}

void draw() {
  myGame.Update();
  myGame.Render();
}
