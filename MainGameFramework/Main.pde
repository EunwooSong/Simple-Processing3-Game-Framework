MainFramework myGame;

void settings() {
  size(800, 600);
}

void setup() {
  myGame = new MainFramework();
  
  Scene tmp = new Scene();
  tmp.AddChild(new Test());
  
  myGame.ChangeScene(new MainScene());
}

void draw() {
  myGame.Update();
  myGame.Render();
}
