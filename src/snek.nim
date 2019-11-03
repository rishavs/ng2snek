import
    nimgame2 / [
        nimgame,
        settings,
        types,
        assets,
        scene
    ],
    data,
    scenes/main,
    scenes/title

game = newGame()

if game.init(GameWidth, GameHeight, title = GameTitle, integerScale = true):
    # Init
    game.setResizable(true) # Window could be resized
    game.minSize = (GameWidth, GameHeight) # Minimal window size
    # game.windowSize = (GameWidth * 2, GameHeight * 2) # Double scaling (1280x720)
    game.centrify() # Place window at the center of the screen

    loadData()
    
    # Create scenes
    titleScene = newTitleScene()
    mainScene = newMainScene()

    # Run
    game.scene = titleScene # Initial scene
    game.run()  # Let's go!