/* blackbearddark.h */
static const char black[]       = "#1C1B1A";  // Background
static const char white[]       = "#F4E3C1";  // Foreground
static const char gray2[]       = "#454240";  // Unfocused window border
static const char gray3[]       = "#614A4D";  // Bright black
static const char gray4[]       = "#AA9E87";  // Normal white
static const char blue[]        = "#5A8CA5";  // Focused window border
static const char green[]       = "#73A857";
static const char red[]         = "#D13438";
static const char orange[]      = "#F4A259";  // Selection background
static const char yellow[]      = "#F1C232";
static const char pink[]        = "#A066C9";
static const char col_borderbar[] = "#1C1B1A"; // Inner border

/* Define the colors array for dwm */
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { white,      black,     gray2  }, // Normal: white text, black bg, gray2 border
    [SchemeSel]  = { white,      orange,    blue   }, // Selected: white text, orange bg, blue border
};
