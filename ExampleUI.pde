// THIS IS FOR ME TO MESS AROUND WITH CREATING ELEMENTS
// CAN BE SAFELY IGNORED FROM SET-UP PROCEDURE.

// Realistically speaking, if you see this then it means I probably pushed my dev branch to main without checking everything, oops.

ContainerFrame testFrame;
ContainerFrame testSubsetFrame;
TextLabel testLabel;
Button testTextButton;
Button testIconButton;
ImageLabel testImageLabel;
ImageLabel testImageLabelDest;
ShapeLabel testShapeLabel;

Slider testSlider;
TextLabel currentSliderValue;

boolean moveTestFrame = false;
int direction = 1;

void devTestSetupMethod() {

    testFrame = new ContainerFrame(null, null, null);
    testFrame.setZIndex(20);
    testFrame.setPosition(10, 10);
    testFrame.setSize(100, 200);

    testSubsetFrame = new ContainerFrame(testFrame, null, null);
    testSubsetFrame.setZIndex(5);
    testSubsetFrame.setAnchorPoints(0.5, 0.5);
    testSubsetFrame.setPosition(50, 100);
    testSubsetFrame.setSize(50, 50);

    // TextLabel test
    // testLabel = new TextLabel(testFrame, null, null, true);
    // testLabel.setPosition(300, 100);
    // testLabel.setZIndex(1000);
    // testLabel.setContent("Testing!");

    // Container parent, UITheme theme, int zIndex, float xPos, float yPos, float xSize, float ySize
    // Button test
    // testButton = new Button(testFrame, null, 20, 16, 64, 100, 24);
    // testButton.setContent("Press Me! ;)");
    // testButton.setOnHover(this::hoverwdwTest);
    // testButton.setOnClick(this::test);

    

    FrameStyle[] A = DefaultTheme.buttonStylePack("REGULAR");

    // IconButton Test
    testIconButton = new Button(testFrame, null, A, true);

    testIconButton.setZIndex(20);
    testIconButton.setPosition(16, 16);
    testIconButton.setSize(48, 48);

    testIconButton.setIcon("clock.svg");
    testIconButton.setOnClick(this::testSearch);

    testIconButton.setSwitchState(true);


    // TextButton Test
    testTextButton = new Button(testFrame, null, A, false);
    testTextButton.setZIndex(100);
    testTextButton.setSize(200, 50);
    testTextButton.setAnchorPoints(0, 1);
    testTextButton.setPosition(16, 200);

    testTextButton.setContent("Drive Forward");
    testTextButton.updateLabelStylePack(DefaultTheme.textLabelStylePack("BUTTON"));

    testTextButton.setOnClick(this::test);


    // Image test
    testImageLabelDest = new ImageLabel(null, null, "rigby.jpeg");
    testImageLabelDest.setSize(200,400);
    testImageLabelDest.setPosition(400,50);


    // Shape test
    // testShapeLabel = new ShapeLabel(null, null, 100, "clock.svg", false, 10, 10, 120, 120);

    // Movement test


    // Slider Test
    testSlider = new Slider(testFrame, null, 0, 100);
    testSlider.setPosition(300, 20);
    testSlider.setIncrementUnit(5);
    testSlider.setSize(150,50);

    currentSliderValue = new TextLabel(testFrame, null, null, true);
    currentSliderValue.setPosition(0, 400);
    currentSliderValue.setSize(100,40);


    // TextBox Test
    TextBox testTextBox = new TextBox(null, null, null, true);
    testTextBox.setPosition(16, 500);
    

}


void devTestDrawMethod() {

    // println(testIconButton.getSwitchState());

    if (moveTestFrame) {
        float[] positions = testFrame.getPosition();
        if (positions[0] > width - testFrame.getSize()[0]) direction = -1;
        if (positions[0] < 0) direction = 1;

        testFrame.setPosition(positions[0]+10*direction, positions[1]);
    }

    currentSliderValue.setContent(Double.toString(testSlider.getCurrentValue()));

    // println(testTextButton.getSwitchState());
}

void test() {
    // moveTestFrame = !moveTestFrame;
    testIconButton.setSwitchState(true);
    // println("sike!!");
}

void testSearch() {

    moveTestFrame = !moveTestFrame;
    
    testImageLabelDest.setVisible(!testImageLabelDest.visible);

    float randomX = random(100, 400);
    float randomY = random(100, 400);
    testFrame.setSize(randomX, randomY);
    testSubsetFrame.setPosition(randomX/2, randomY/2);

    testIconButton.setSize(randomX/2, randomY/2);

    // float[] positions = testFrame.getPosition();
    // testFrame.setPosition(positions[0] + 16, 16);
}