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

    devTestMethod();
}

void draw() {
    
    background(#FFBB00);
    proactDrawLoop();

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

void devTestMethod() {
    // Initialize Root
    proactRoot = new UIRoot(this, 1, true);
    proactRoot.setVisible(true);

    testFrame = new ContainerFrame(null, null, 20, 10, 10, 100, 200);
    testSubsetFrame = new ContainerFrame(testFrame, null, 5, 50, 100, 50, 50);
    testSubsetFrame.setAnchorPoints(0.5, 0.5);

    // TextLabel test
    // public TextLabel(Container parent, UITheme theme, boolean hasVisualFrame, int zIndex, float xPos, float yPos, float xSize, float ySize)
    testLabel = new TextLabel(null, null, true, 10, 300, 100, 80, 24);
    testLabel.setContent("Testing!");
    // testLabel.render();

    // Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize
    // Button test
    testButton = new Button(testFrame, null, 20, 16, 64, 100, 24);
    testButton.setContent("Press Me! ;)");
    testButton.setOnHover(this::hoverwdwTest);
    testButton.setOnClick(this::test);

    testIconButton = new Button(testFrame, null, 20, 16, 128, 36, 36);
    testIconButton.setIcon("testicon.png");
    testIconButton.setOnClick(this::testSearch);


    // Image test
    testImageLabelDest = new ImageLabel(null, null, 1, "rigby.jpeg", 200, 16, 300, 300);


    // Shape test
    testShapeLabel = new ShapeLabel(null, null, 100, "clock.svg", true, 10, 10, 120, 120);

}

void test() {
    println("sike!!");
}

void testSearch() {
    println("searching for the epstein files");
}

void hoverwdwTest() {
    // println("i know you want it!!");
}