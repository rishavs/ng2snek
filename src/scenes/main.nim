import
    nimgame2 / [
        nimgame,
        settings,
        scene,
        types,
        textGraphic,
        entity,
    ],
    ../data
    
type
    MainScene = ref object of Scene
    
proc init*(scene: MainScene) =
    init Scene(scene)

    let titleText = newTextGraphic(bigFont)
    titleText.setText("Game Starts")
    let title = newEntity()
    title.graphic = titleText
    title.centrify()
    title.pos = (GameWidth / 2, GameHeight / 3)
    scene.add(title)
    
proc free*(scene: MainScene) =
    discard
    
proc newMainScene*(): MainScene =
    new result, free
    init result
    
method show*(scene: MainScene) =
    echo "Switched to MainScene"