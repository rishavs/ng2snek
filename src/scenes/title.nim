import
    nimgame2 / [
        assets,
        entity,
        font,
        gui/button,
        gui/widget,
        input,
        mosaic,
        nimgame,
        scene,
        settings,
        textgraphic,
        texturegraphic,
        types,
    ],
    ../data
    
type
    TitleScene = ref object of Scene

# Play action procedure
proc startgame(widget: GuiWidget) =
    echo "Clicked Play"
    game.scene = mainScene
    
# Exit action procedure
proc exitgame(widget: GuiWidget) =
    gameRunning = false

proc init*(scene: TitleScene) =
    init Scene(scene)

    var
        btnPlay, btnExit: GuiButton
        btnPlayLabel, btnExitLabel: TextGraphic

    # Play button
    btnPlayLabel = newTextGraphic(defaultFont)
    btnPlayLabel.setText("PLAY")
    btnPlay = newGuiButton(buttonSkin, btnPlayLabel)
    btnPlay.centrify()
    btnPlay.pos = (GameWidth / 2, GameHeight / 2)
    btnPlay.actions.add(startgame) # assign the action procedure
    scene.add(btnPlay)

    # Exit button
    btnExitLabel = newTextGraphic(defaultFont)
    btnExitLabel.setText("EXIT")
    btnExit = newGuiButton(buttonSkin, btnExitLabel)
    btnExit.centrify()
    btnExit.pos = (GameWidth / 2, GameHeight / 2 + 64)
    btnExit.actions.add(exitgame) # assign the action procedure
    scene.add(btnExit)

    # Title text
    let titleText = newTextGraphic(bigFont)
    titleText.setText(GameTitle)
    let title = newEntity()
    title.graphic = titleText
    title.centrify()
    title.pos = (GameWidth / 2, GameHeight / 3)
    scene.add(title)

proc free*(scene: TitleScene) =
    discard

proc newTitleScene*(): TitleScene =
    new result, free
    init result

method show*(scene: TitleScene) =
    echo "Switched to TitleScene"
    showCursor()

method render*(scene: TitleScene) =
    # don't forget to call the parent render!
    scene.renderScene()
    # if you want to draw something on top of a rendered scene,
    # you do it here

method update*(scene: TitleScene, elapsed: float) =
    # don't forget to call the parent update!
    scene.updateScene(elapsed)
    # scene-level logic goes here

method event*(scene: TitleScene, event: Event) =
    # call it if your entities have their own event handlers
    # scene.eventScene(event)
    # if you want to handle some events manually, you do it here
    if event.kind == KeyDown:
        case event.key.keysym.sym:
        of K_ESCAPE:
            # stop the engine (see nimgame2/settings.nim)
            gameRunning = false
        of K_RETURN:
            game.scene=mainScene
        else: discard