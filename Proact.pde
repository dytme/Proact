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



// █▀▀ █░░ ▄▀█ █▀ █▀   █▀█ █▄▄ ░░█ █▀▀ █▀▀ ▀█▀ █▀
// █▄▄ █▄▄ █▀█ ▄█ ▄█   █▄█ █▄█ █▄█ ██▄ █▄▄ ░█░ ▄█

// Class Objects that need to be referenced globally

UITheme DefaultTheme = new DefaultThemeClass();
// UITheme DarkTheme = new DarkThemeClass();


// █▀ █▀▀ ▀█▀ █░█ █▀█
// ▄█ ██▄ ░█░ █▄█ █▀▀

UIRoot proactRoot;

void setup() {
    // OPT: Set Canvas Size
    size(600,600);

    devTestSetupMethod();
}

void draw() {
    
    background(#FFBB00);
    proactDrawLoop();

    devTestDrawMethod();

    // delay(500);

}












// █▀▀ █░█ █▀▀ █▄░█ ▀█▀   █░█ ▄▀█ █▄░█ █▀▄ █░░ █▀▀ █▀█   █▀▀ █▀█ █▄░█ █▄░█ █▀▀ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
// ██▄ ▀▄▀ ██▄ █░▀█ ░█░   █▀█ █▀█ █░▀█ █▄▀ █▄▄ ██▄ █▀▄   █▄▄ █▄█ █░▀█ █░▀█ ██▄ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

void mousePressed() {
    proactMousePressed(mouseX, mouseY);
}


void mouseReleased() {
    proactMouseReleased();
}



// THIS IS FOR ME TO MESS AROUND WITH CREATING ELEMENTS
// CAN BE SAFELY IGNORED FROM SET-UP PROCEDURE.

// Realistically speaking, if you see this then it means I probably pushed my dev branch to main without checking everything, oops.

ContainerFrame testFrame;
ContainerFrame testSubsetFrame;
TextLabel testLabel;
Button testButton;
Button testIconButton;
ImageLabel testImageLabel;
ImageLabel testImageLabelDest;
ShapeLabel testShapeLabel;

boolean moveTestFrame = false;
int direction = 1;

void devTestSetupMethod() {
    // Initialize Root
    proactRoot = new UIRoot(this, 1, true);
    proactRoot.setVisible(true);

    testFrame = new ContainerFrame(null, null);
    testFrame.setZIndex(20);
    testFrame.setPosition(10, 10);
    testFrame.setSize(100, 200);

    testSubsetFrame = new ContainerFrame(testFrame, null);
    testSubsetFrame.setZIndex(5);
    testSubsetFrame.setPosition(50, 100);
    testSubsetFrame.setAnchorPoints(0.5, 0.5);
    testSubsetFrame.setSize(50, 50);

    // TextLabel test
    // public TextLabel(Container parent, UITheme theme, boolean hasVisualFrame, int zIndex, float xPos, float yPos, float xSize, float ySize)
    testLabel = new TextLabel(null, null, true, 10, 300, 100, 80, 24);
    testLabel.setContent("Testing!");
    // testLabel.render();

    // Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize
    // Button test
    // testButton = new Button(testFrame, null, 20, 16, 64, 100, 24);
    // testButton.setContent("Press Me! ;)");
    // testButton.setOnHover(this::hoverwdwTest);
    // testButton.setOnClick(this::test);

    testIconButton = new Button(testFrame, null, true);

    testIconButton.setZIndex(20);
    testIconButton.setPosition(16, 16);
    testIconButton.setSize(48, 48);

    testIconButton.setIcon("clock.svg");
    testIconButton.setOnClick(this::testSearch);


    // Image test
    testImageLabelDest = new ImageLabel(null, null, 1, "rigby.jpeg", 200, 16, 300, 300);


    // Shape test
    // testShapeLabel = new ShapeLabel(null, null, 100, "clock.svg", false, 10, 10, 120, 120);

    // Movement test
    

}


void devTestDrawMethod() {

    // println(testIconButton.getSwitchState());

    if (moveTestFrame) {
        float[] positions = testFrame.getPosition();
        if (positions[0] > width - testFrame.getSize()[0]) direction = -1;
        if (positions[0] < 0) direction = 1;

        testFrame.setPosition(positions[0]+10*direction, positions[1]);
    }
}

void test() {
    moveTestFrame = !moveTestFrame;
    println("sike!!");
}

void testSearch() {
    
    testImageLabelDest.setVisible(!testImageLabelDest.visible);

    float randomX = random(100, 400);
    float randomY = random(100, 400);
    testFrame.setSize(randomX, randomY);
    testSubsetFrame.setPosition(randomX/2, randomY/2);

    testIconButton.setSize(randomX/2, randomY/2);

    // float[] positions = testFrame.getPosition();
    // testFrame.setPosition(positions[0] + 16, 16);
}

void hoverwdwTest() {
    // println("i know you want it!!");
}