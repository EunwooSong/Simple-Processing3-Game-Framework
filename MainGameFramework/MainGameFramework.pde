int debugMode = 1; //1 : Debug

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
