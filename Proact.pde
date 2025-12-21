/*

                                           █
          █░░ █ █▀▄▀█ █ ▀█▀ █░░ █▀▀ █▀ █▀  █  ██████╗░██████╗░░█████╗░░█████╗░░█████╗░████████╗
          █▄▄ █ █░▀░█ █ ░█░ █▄▄ ██▄ ▄█ ▄█  █  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
                                           █  ██████╔╝██████╔╝██║░░██║███████║██║░░╚═╝░░░██║░░░
█ █▄░█ ▀█▀ █▀▀ █▀█ ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█  █  ██╔═══╝░██╔══██╗██║░░██║██╔══██║██║░░██╗░░░██║░░░
█ █░▀█ ░█░ ██▄ █▀▄ █▀█ █▄▄ ░█░ █ █▄█ █░▀█  █  ██║░░░░░██║░░██║╚█████╔╝██║░░██║╚█████╔╝░░░██║░░░
                                           █  ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░

Version 2.0 Alpha

*/




// █▀ ▀█▀ ▄▀█ ▀█▀ █▀▀   █▀▀ █▄░█ █░█ █▀▄▀█ █▀
// ▄█ ░█░ █▀█ ░█░ ██▄   ██▄ █░▀█ █▄█ █░▀░█ ▄█

// What states can a UI element have?

enum UIState {
    DEFAULT,     // Basically Default, but I wanted to avoid confusion with the DefaultTheme
    HOVERED,    // When a cursor or mouse is on top of the element
    ACTIVE,     // When the element is pressed/dragged/actively messed around with
    DISABLED,   // When interactions are disabled with the element
}





// █▀▀ █░░ ▄▀█ █▀ █▀   █▀█ █▄▄ ░░█ █▀▀ █▀▀ ▀█▀ █▀
// █▄▄ █▄▄ █▀█ ▄█ ▄█   █▄█ █▄█ █▄█ ██▄ █▄▄ ░█░ ▄█

// Class Objects that need to be referenced globally

UITheme DefaultTheme = new DefaultThemeClass();
// UITheme DarkTheme = new DarkThemeClass();


// █▀ █▀▀ ▀█▀ █░█ █▀█
// ▄█ ██▄ ░█░ █▄█ █▀▀

UIRoot proactRoot;
Frame testFrame;
Frame testSubsetFrame;

void setup() {
    size(400,400);

    proactRoot = new UIRoot(1, true);
    proactRoot.setVisible(true);
    // Frame(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize)
    testFrame = new Frame(null, null, 1, 10, 10, 100, 200);
    testFrame.setVisible(true);
    testSubsetFrame = new Frame(testFrame, null, 1, 150, 25, 50, 50);
    testSubsetFrame.setVisible(true);
}

void draw() {
    
    background(#FFFFFF);
    renderUI();

}





// █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
// █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   ██▄ █░▀█ █▄█ █ █░▀█ ██▄

ArrayList<UIRoot> UIRoots = new ArrayList<>();

void renderUI() {
    
    println("render ui loop");

    for (UIRoot root : UIRoots) {
        println("suitable root found. giving command");
        if (root.visible) root.render();
    }

}

void mousePressed() {
    testFrame.setVisible(!testFrame.visible);
}
