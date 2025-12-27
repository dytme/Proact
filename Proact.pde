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




import processing.core.PApplet;

// █▀ ▀█▀ ▄▀█ ▀█▀ █▀▀   █▀▀ █▄░█ █░█ █▀▄▀█ █▀
// ▄█ ░█░ █▀█ ░█░ ██▄   ██▄ █░▀█ █▄█ █░▀░█ ▄█

// What states can a UI element have?

enum UIState {
    DEFAULT,     // Basically Default, but I wanted to avoid confusion with the DefaultTheme
    HOVERED,    // When a cursor or mouse is on top of the element
    ACTIVATED,     // When the element is pressed/dragged/actively messed around with
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

    proactRoot = new UIRoot(this, 1, true);
    proactRoot.setVisible(true);
    // Frame(Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize)
    testFrame = new Frame(null, null, 20, 10, 10, 100, 200);
    testFrame.setVisible(true);
    testSubsetFrame = new Frame(testFrame, null, 50, 50, 100, 50, 50);
    testSubsetFrame.setVisible(true);
    testSubsetFrame.setAnchorPoints(0.5, 0.5);
}

void draw() {
    
    background(#FFFFFF);
    proactLoop();

    // delay(500);

}





// █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
// █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   ██▄ █░▀█ █▄█ █ █░▀█ ██▄

ArrayList<UIRoot> UIRoots = new ArrayList<>();

void proactLoop() {
    
    // Render UI Loop
    // println("render ui loop");

    for (UIRoot root : UIRoots) {
        // println("suitable root found. giving command");
        if (root.visible) root.render();
    }

    // Event Handling
    
    // TODO: Figure out a way to implement a hierarchy of states. (Maybe works? test it out once you have onClick as well)
    // CLICK > HOVER > etc.

    // Reset all hovered elements from the previous round until proven otherwise
    for (Hoverable element : Events.hoverableElements) {
        if (element.getUIState() == UIState.HOVERED) element.setUIState(UIState.DEFAULT);
    }

    // Check if an element is actually being hovered over.
    for (Hoverable element : Events.hoverableElements) {
        if (element.isMouseOver(mouseX, mouseY)) {
            if (element.getUIState() == UIState.DEFAULT) element.setUIState(UIState.HOVERED); // Only apply the style if the state of the button is default (other states like ACTIVATED through clicking take priority here)
            return; // Not break, to only stop this method and not the entire draw loop.
        } else element.setUIState(UIState.DEFAULT); // Also added here to facilitate MouseLeave() like behavior.
    }

}

void mousePressed() {
    
    for (Clickable element : Events.clickableElements) {
        if (element.isClicked(mouseX, mouseY)) { 
            println(element + " has been clicked!"); 
            element.setUIState(UIState.ACTIVATED);
            return;
        }
    }

    // testFrame.setVisible(!testFrame.visible);
}

// Once the mouse button is released, deactivate any activated elements.
void mouseReleased() {
    for (Clickable element : Events.clickableElements) {
        if (element.getUIState() == UIState.ACTIVATED) element.setUIState(UIState.DEFAULT);
    }
}

// TODO: Find a way to stop the hover animation for applying itself while the mouse is being held down on top of a button.
// TODO: Parse mouseX and mouseY through
// TODO: Update everything to reference PApplet instead of processing directly