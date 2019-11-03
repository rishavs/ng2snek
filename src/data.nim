import
    nimgame2 / [
        scene, 
        font,
        truetypefont,
        mosaic,
        texturegraphic,
    ]

const
    GameWidth* = 640
    GameHeight* = 480
    GameTitle* = "HUNGRE SNEK"

var
    titleScene*, mainScene*: Scene
    defaultFont*, bigFont* : TrueTypeFont
    buttonMosaic*: Mosaic
    buttonSkin*: TextureGraphic

proc loadData* () = 
    defaultFont = newTrueTypeFont()
    if not defaultFont.load("assets/fnt/FSEX300.ttf", 16) : echo "ERROR: Can't load font"
    
    bigFont = newTrueTypeFont()
    if not bigFont.load("assets/fnt/FSEX300.ttf", 32) : echo "ERROR: Can't load font"

    buttonMosaic = newMosaic("assets/gfx/button.png", (8, 8))
    buttonSkin = newTextureGraphic()
    discard buttonSkin.assignTexture(buttonMosaic.render( patternStretchBorder(8, 2)))

proc freeData* () =
    defaultFont.free()
    bigFont.free()
    buttonSkin.free()
    buttonMosaic.free()