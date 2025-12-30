// package proact.utilities


// █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▀ █▄░█ █▀▀ █ █▄░█ █▀▀
// █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   ██▄ █░▀█ █▄█ █ █░▀█ ██▄

ArrayList<UIRoot> UIRoots = new ArrayList<>();

void proactDrawLoop() {
    
    // Render UI Loop

    for (UIRoot root : UIRoots) {
        if (root.visible) root.render();
    }

    // EVENT HANDLING

    // Reset all hovered elements from the previous round until proven otherwise
    for (Hoverable element : Events.hoverableElements) {
        if (element.getUIState() == UIState.HOVERED) element.setUIState(UIState.DEFAULT);
    }

    // Reset hoveredElement by default, which will be overwritten only if we actually find a hoveredElement.
    Events.hoveredElement = null;

    // Check if an element is actually being hovered over.
    for (Hoverable element : Events.hoverableElements) {
        if (element.isMouseOver(mouseX, mouseY)) {

            if (element.getUIState() == UIState.DEFAULT) element.setUIState(UIState.HOVERED); // Only apply the style if the state of the button is default (other states like ACTIVATED through clicking take priority here)
            element.mouseHovered(); // Tell the element that it's being hovered.

            Events.hoveredElement = (UIElement) element; // Store the latest hovered element into the globally accessible field.

            return; // Not break, to only stop this method and not the entire draw loop.

        } else element.setUIState(UIState.DEFAULT); // Also added here to facilitate MouseLeave() like behavior.
    }

}




// █▀█ █▀█ █▀█ ▄▀█ █▀▀ ▀█▀   █▀▀ █░█ █▀▀ █▄░█ ▀█▀   █░█ ▄▀█ █▄░█ █▀▄ █░░ █▀▀ █▀█ █▀
// █▀▀ █▀▄ █▄█ █▀█ █▄▄ ░█░   ██▄ ▀▄▀ ██▄ █░▀█ ░█░   █▀█ █▀█ █░▀█ █▄▀ █▄▄ ██▄ █▀▄ ▄█

// Logic that runs whenever an event handler is triggered.
// These *MUST* be connected to the actual event handlers within the Processing sketch.


// Check if an element is clicked when the mouse is being pressed
// cx: mouseX // cy: mouseY
void proactMousePressed(float cx, float cy) {
    for (Clickable element : Events.clickableElements) {
        if (element.isClicked(cx, cy)) {

            element.setUIState(UIState.ACTIVATED);
            element.mouseClicked(); // Tell the element that it's being clicked.

            Events.focusedElement = (UIElement) element; // Store the latest clicked element into globally accessible field (as the currently focused on element)

            return; // Once the first element in decreasing order of their zIndex is clicked, stop seeking if any other elements have been clicked or not.

        }
    }
}


// Once the mouse button is released, reset all activated elements to their default state
void proactMouseReleased() {
    for (Clickable element : Events.clickableElements) {
        if (element.getUIState() == UIState.ACTIVATED) element.setUIState(UIState.DEFAULT);
    }
}


// TODO: Implement this
// mouseDragged() is fired whenever the mouse moves while leftClick is held down.
// hence, there's no need for 'release' logic, as the slider will simply stop moving/updating it's position and automatically store the newest value in it's fields.
void proactMouseDragged() {

    // As we're already processing the interaction through the logic for hovered elements, we don't have to worry about any other checks besides runtime type.

    if (Events.hoveredElement instanceof Draggable) { // Whenever the mouse starts to be dragged, check if hoveredElement is also draggable at runtime.
                                                      // instanceof also doesn't throw a NullPointerException when hoveredElement is null, so we don't have to worry about that.
        // Events.hoveredElement.moveToMouse(mouseX, mouseY); // TODO: Implement this when we have an actual slider :))
        
    }
}